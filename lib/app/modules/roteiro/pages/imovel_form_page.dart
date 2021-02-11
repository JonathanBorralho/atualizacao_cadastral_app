import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:atualizacao_cadastral_app/app/shared/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ImovelFormPage extends StatelessWidget {
  final Imovel imovel;

  ImovelFormPage(this.imovel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${imovel.roteirizacao.matricula}'),
      ),
      body: SingleChildScrollView(
        child: ImovelForm(imovel),
      ),
    );
  }
}

class ImovelForm extends StatefulWidget {
  final Imovel imovel;

  const ImovelForm(this.imovel);

  @override
  _ImovelFormState createState() => _ImovelFormState();
}

class _ImovelFormState extends State<ImovelForm> {
  FormGroup _form;
  FormBuilder _fb = FormBuilder();

  @override
  void initState() {
    super.initState();

    _form = _fb.group({
      'id': null,
      'roteiro_id': null,
      'roteirizacao': _fb.group({
        'matricula': FormControl<int>(),
        'visita': FormControl<int>(),
        'localidade': null,
        'setor': null,
        'quadra': null,
        'rota': null,
        'sequencia': null,
        'sublote': null,
        'testada': null,
      }),
      'endereco': _fb.group({
        'logradouro': null,
        'cep': null,
        'bairro': null,
        'numero': null,
        'complemento': null,
      }),
    });

    _form.patchValue(widget.imovel.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: _form,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomInputField(
              formControlName: 'roteirizacao.matricula',
              labelText: 'Matrícula',
              oldValue: widget.imovel.roteirizacao.matricula,
            ),
            ReactiveTextField(
              formControlName: 'roteirizacao.visita',
              decoration: const InputDecoration(labelText: 'Visita'),
            ),
            ReactiveTextField(
              formControlName: 'roteirizacao.localidade',
              decoration: const InputDecoration(labelText: 'Localidade'),
            ),
            ReactiveTextField(
              formControlName: 'roteirizacao.setor',
              decoration: const InputDecoration(labelText: 'Setor'),
            ),
            Divider(),
            ReactiveTextField(
              formControlName: 'endereco.logradouro',
              decoration: const InputDecoration(labelText: 'Logradouro'),
            ),
            ReactiveTextField(
              formControlName: 'endereco.cep',
              decoration: const InputDecoration(labelText: 'CEP'),
            ),
            ReactiveTextField(
              formControlName: 'endereco.bairro',
              decoration: const InputDecoration(labelText: 'Bairro'),
            ),
            ReactiveTextField(
              formControlName: 'endereco.numero',
              decoration: const InputDecoration(labelText: 'Número'),
            ),
            ReactiveTextField(
              formControlName: 'endereco.complemento',
              decoration: const InputDecoration(labelText: 'Complemento'),
            ),
            SizedBox(height: 16),
            ReactiveFormConsumer(
              builder: (context, form, child) {
                return ElevatedButton(
                  child: const Text('SALVAR'),
                  onPressed: form.valid ? () {
                    var imoveis = Hive.box<Imovel>('imoveis');
                    var imovelUpdated = Imovel.fromJson(form.value);
                    imoveis.put(widget.imovel.key, imovelUpdated);
                  } : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
