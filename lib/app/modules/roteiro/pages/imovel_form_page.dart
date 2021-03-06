import 'package:atualizacao_cadastral_app/app/modules/roteiro/widgets/imovel_form/dropdown_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart' hide Consumer;
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/dropdowns_config.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/services/dropdowns_config_service.dart';

import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/state/stepper_controller.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/widgets/imovel_form/roteirizacao_step_form.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/widgets/imovel_form/endereco_step_form.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/widgets/imovel_form/cliente_step_form.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/widgets/imovel_form/subcategoria_economias_step_form.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/widgets/imovel_form/caracteristicas_step_form.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/widgets/imovel_form/hidrometro_step_form.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/widgets/imovel_form/conclusao_step_form.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/widgets/imovel_form/coordenadas_step_form.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/widgets/imovel_form/gerar_coordenadas_button.dart';
import 'package:atualizacao_cadastral_app/app/shared/widgets/loading_indicator.dart';

class ImovelFormPage extends StatefulWidget {
  final Imovel imovel;

  ImovelFormPage(this.imovel);

  @override
  _ImovelFormPageState createState() => _ImovelFormPageState();
}

class _ImovelFormPageState extends State<ImovelFormPage> {
  FormGroup _form;
  FormBuilder _fb = FormBuilder();

  @override
  void initState() {
    super.initState();

    _form = _fb.group({
      'key': widget.imovel.key,
      'id': null,
      'roteiro_id': null,
      'impedimento': FormControl<Tipo>(),
      'modificado_em': null,
      'roteirizacao': _fb.group({
        'matricula': FormControl<int>(),
        'visita': FormControl<int>(),
        'localidade': FormControl<int>(),
        'setor': FormControl<int>(),
        'quadra': FormControl<int>(),
        'rota': FormControl<int>(),
        'sequencia': FormControl<int>(),
        'sublote': FormControl<int>(),
        'testada': FormControl<int>(),
      }),
      'endereco': _fb.group({
        'logradouro': null,
        'cep': null,
        'bairro': null,
        'numero': null,
        'complemento': null,
      }),
      'cliente': _fb.group({
        'codigo': FormControl<int>(),
        'nome': null,
        'cpf': null,
        'rg': null,
        'uf': null,
        'email': null,
        'sexo': null,
        'org_exp': null,
        'data_emissao': FormControl<DateTime>(),
        'tipo_cliente': FormControl<String>(),
        'tipo_pessoa': null,
        'data_nascimento': FormControl<DateTime>(),
        'nome_mae': null,
        'tel_ddd': null,
        'tel_num': null,
      }),
      'subcategorias': _fb.group({
        'cat_1': null,
        'subcat_1': null,
        'economias': FormControl<int>(),
        'cat_2': null,
      }),
      'caracteristicas': _fb.group({
        'area': FormControl<int>(),
        'calcada': FormControl<Tipo>(),
        'tipo_rua': FormControl<Tipo>(),
        'abastecimento': FormControl<Tipo>(),
        'agua': FormControl<Tipo>(),
        'esgoto': FormControl<Tipo>(),
        'habitacao': FormControl<Tipo>(),
        'propriedade': FormControl<Tipo>(),
        'construcao': FormControl<Tipo>(),
        'cobertura': FormControl<Tipo>(),
      }),
      'conclusao': _fb.group({
        'pt_agua': FormControl<int>(),
        'moradores': FormControl<int>(),
      }),
      'hidrometro': _fb.group({
        'trocar': FormControl<bool>(value: false),
        'hidrometro': FormControl<String>(),
        'leitura': FormControl<int>(),
        'data_leitura': FormControl<DateTime>(),
      }),
      'coordenadas': _fb.group({
        'latitude': FormControl<double>(),
        'longitude': FormControl<double>(),
      }),
      'observacao': FormControl<String>(),
    });

    var imovelMap = widget.imovel.toJson();
    imovelMap['cliente']['data_emissao'] = widget.imovel.cliente.dataEmissao;
    imovelMap['cliente']['data_nascimento'] = widget.imovel.cliente.dataNascimento;
    imovelMap['hidrometro']['data_leitura'] = widget.imovel.hidrometro.dataLeitura;
    imovelMap['coordenadas'] = imovelMap['coordenadas'] ?? Coordenadas().toJson();
    _form.patchValue(imovelMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.imovel.roteirizacao.matricula}'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => StepperController(length: 9),
          ),
          Provider.value(value: this.widget.imovel),
        ],
        child: ReactiveForm(
          formGroup: _form,
          child: FutureBuilder<DropdownsConfig>(
            future: Modular.get<DropdownsConfigService>().getConfig(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Provider.value(
                  value: snapshot.data,
                  child: const ImovelFormGroup(),
                );
              }

              return const LoadingIndicator();
            },
          ),
        ),
      ),
      floatingActionButton: ImovelSaveButton(form: _form, widget: widget),
    );
  }
}

class ImovelSaveButton extends StatelessWidget {
  const ImovelSaveButton({
    Key key,
    @required FormGroup form,
    @required this.widget,
  }) : _form = form, super(key: key);

  final FormGroup _form;
  final ImovelFormPage widget;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.save),
      onPressed: () async {
        var imoveis = Hive.box<Imovel>('imoveis');
        Imovel imovel = Imovel.fromJson(_form.value);

        imoveis.put(widget.imovel.key, imovel.copyWith(modificadoEm: DateTime.now()));

        Scaffold.of(context).showSnackBar(
          SnackBar(content: const Text('Imóvel salvo com sucesso')),
        );
      },
    );
  }
}

class ImovelFormGroup extends StatelessWidget {
  const ImovelFormGroup();

  @override
  Widget build(BuildContext context) {
    final DropdownsConfig config = context.read<DropdownsConfig>();
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: DropdownInputField(
            labelText: 'Impedimento',
            formControlName: 'impedimento',
            items: config.tipoImpedimento.map(tipoToDropdownMenuItem).toList(),
          ),
        ),
        Consumer<StepperController>(
          builder: (context, state, child) => Stepper(
            physics: ClampingScrollPhysics(),
            steps: [
              Step(
                title: const Text('Roteirização'),
                state: StepState.indexed,
                content: const RoteirizacaoStepForm(),
                isActive: state.currentStep == 0,
              ),
              Step(
                title: const Text('Endereço'),
                state: StepState.indexed,
                content: const EnderecoStepForm(),
                isActive: state.currentStep == 1,
              ),
              Step(
                title: const Text('Cliente'),
                state: StepState.indexed,
                content: const ClienteStepForm(),
                isActive: state.currentStep == 2,
              ),
              Step(
                title: const Text('Subcategoria/Econimias'),
                state: StepState.indexed,
                content: const SubcategoriaEconomiasStepForm(),
                isActive: state.currentStep == 3,
              ),
              Step(
                title: const Text('Características'),
                state: StepState.indexed,
                content: const CaracteristicasStepForm(),
                isActive: state.currentStep == 4,
              ),
              Step(
                title: const Text('Conclusão'),
                state: StepState.indexed,
                content: const ConclusaoStepForm(),
                isActive: state.currentStep == 5,
              ),
              Step(
                title: const Text('Hidrômetro'),
                state: StepState.indexed,
                content: const HidrometroStepForm(),
                isActive: state.currentStep == 6,
              ),
              Step(
                title: const Text('Coordenadas'),
                state: StepState.indexed,
                content: const CoordenadasStepForm(),
                isActive: state.currentStep == 7,
              ),
              Step(
                title: const Text('Observação'),
                state: StepState.indexed,
                content: ReactiveTextField(
                  formControlName: 'observacao',
                  textInputAction: TextInputAction.done,
                ),
                isActive: state.currentStep == 8,
              ),
            ],
            currentStep: state.currentStep,
            onStepContinue: state.onStepContinue,
            onStepCancel: state.onStepCancel,
            onStepTapped: state.onStepTapped,
            controlsBuilder: (context, {onStepCancel, onStepContinue}) {
              return StepperControls(
                onStepCancel: onStepCancel,
                onStepContinue: onStepContinue,
              );
            },
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<String> toDropdownMenuItem(String value) {
    return DropdownMenuItem<String>(
      child: Text(value),
      value: value,
    );
  }

  DropdownMenuItem<dynamic> tipoToDropdownMenuItem(Tipo value) {
    final String id = '${value.id}';
    final String text = '${id.padLeft(2, '0')} - ${value.descricao}';
    return DropdownMenuItem<dynamic>(
      child: Text(text),
      value: value,
    );
  }
}

class StepperControls extends StatelessWidget {
  final VoidCallback onStepContinue;
  final VoidCallback onStepCancel;

  const StepperControls({
    Key key,
    this.onStepContinue,
    this.onStepCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StepperController>(
      builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              if (!state.isLast) ...{
                TextButton(
                  onPressed: onStepContinue,
                  child: const Text('PRÓXIMO'),
                ),
              },
              if (!state.isFirst) ...{
                TextButton(
                  onPressed: onStepCancel,
                  child: const Text('ANTERIOR'),
                ),
              },
              if (state.currentStep == 7) ...{
                const GerarCoordenadasButton(),
              },
            ],
          ),
        );
      },
    );
  }
}
