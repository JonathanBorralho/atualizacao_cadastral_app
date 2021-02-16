import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/dropdowns_config.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ClienteSearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DropdownsConfig config = context.read<DropdownsConfig>();
    final FormGroup formGroup = ReactiveForm.of(context);
    final FormControl<String> formControl = formGroup.control('cliente.tipo_cliente');
    final Cliente cliente = context.read<Imovel>().cliente;

    return StreamBuilder<String>(
      initialData: formControl.value,
      stream: formControl.valueChanges,
      builder: (context, snapshot) {
        return InkWell(
          child: InputDecorator(
            isEmpty: !snapshot.hasData,
            decoration: InputDecoration(
              labelText: 'Tipo de Cliente',
              labelStyle: _labelStyle(formControl, cliente.tipoCliente),
              suffixIcon: const Icon(Icons.search),
            ),
            child: Text(snapshot.data ?? ''),
          ),
          onTap: () async {
            final value = await showSearch(
              context: context,
              delegate: TipoClienteSearchDelegate(config.tipoCliente),
            );
            formControl.updateValue(value ?? formControl.value);
            formControl.markAsDirty();
          },
        );
      },
    );
  }

  TextStyle _labelStyle(FormControl formControl, dynamic original) {
    if (!formControl.dirty) return null;
    return original != formControl.value
        ? const TextStyle(color: Colors.orange)
        : null;
  }
}

class TipoClienteSearchDelegate extends SearchDelegate {
  final List<Tipo> tiposCliente;

  TipoClienteSearchDelegate(this.tiposCliente)
      : super(
          searchFieldLabel: 'Pesquisar',
          searchFieldStyle: const TextStyle(color: Colors.white),
        );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          this.query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildList(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) => _buildList(context);

  Widget _buildList(BuildContext context) {
    final List<Tipo> results = _searchQuery(query);
    if (results.isEmpty) {
      return const Center(
        child: const Text(
          'Sem resultados.',
          style: const TextStyle(fontSize: 16),
        ),
      );
    }
    return ListView.separated(
      padding: EdgeInsets.all(12),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final String text = '${results[index].id} - ${results[index].descricao}';
        return ListTile(
          title: Text(text),
          onTap: () => close(context, text),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }

  List<Tipo> _searchQuery(String query) {
    return tiposCliente
        .where((e) => e.descricao.toUpperCase().contains(query.toUpperCase()))
        .toList();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.blue[900],
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      textTheme: theme.textTheme.copyWith(
        headline6: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
