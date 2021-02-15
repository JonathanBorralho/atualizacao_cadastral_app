import 'package:atualizacao_cadastral_app/app/modules/roteiro/models/imovel.dart';
import 'package:atualizacao_cadastral_app/app/modules/roteiro/state/stepper_controller.dart';
import 'package:atualizacao_cadastral_app/app/shared/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
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
      body: ChangeNotifierProvider(
        create: (context) => StepperController(length: 9),
        child: ImovelFormGroup(imovel),
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
                  onPressed: form.valid
                      ? () {
                          var imoveis = Hive.box<Imovel>('imoveis');
                          var imovelUpdated = Imovel.fromJson(form.value);
                          imoveis.put(widget.imovel.key, imovelUpdated);
                        }
                      : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ImovelFormGroup extends StatefulWidget {
  final Imovel imovel;

  const ImovelFormGroup(this.imovel);

  @override
  _ImovelFormGroupState createState() => _ImovelFormGroupState();
}

class _ImovelFormGroupState extends State<ImovelFormGroup> {
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
    return Consumer<StepperController>(
      builder: (context, state, child) => Stepper(
        steps: [
          Step(
            title: const Text('Roteirização'),
            state: StepState.indexed,
            content: Center(child: const Text('Roteirização')),
            isActive: state.currentStep == 0,
          ),
          Step(
            title: const Text('Endereço'),
            state: StepState.indexed,
            content: Center(child: const Text('Endereço')),
            isActive: state.currentStep == 1,
          ),
          Step(
            title: const Text('Cliente'),
            state: StepState.indexed,
            content: Center(child: const Text('Cliente')),
            isActive: state.currentStep == 2,
          ),
          Step(
            title: const Text('Subcategoria/Econimias'),
            state: StepState.indexed,
            content: Center(child: const Text('Subcategoria/Econimias')),
            isActive: state.currentStep == 3,
          ),
          Step(
            title: const Text('Características'),
            state: StepState.indexed,
            content: Center(child: const Text('Características')),
            isActive: state.currentStep == 4,
          ),
          Step(
            title: const Text('Conclusão'),
            state: StepState.indexed,
            content: Center(child: const Text('Conclusão')),
            isActive: state.currentStep == 5,
          ),
          Step(
            title: const Text('Hidrômetro'),
            state: StepState.indexed,
            content: Center(child: const Text('Hidrômetro')),
            isActive: state.currentStep == 6,
          ),
          Step(
            title: const Text('Coordenadas'),
            state: StepState.indexed,
            content: Center(child: const Text('Coordenadas')),
            isActive: state.currentStep == 7,
          ),
          Step(
            title: const Text('Observação'),
            state: StepState.indexed,
            content: Center(child: const Text('Observação')),
            isActive: state.currentStep == 8,
          ),
        ],
        currentStep: state.currentStep,
        onStepContinue: state.onStepContinue,
        onStepCancel: state.onStepCancel,
        onStepTapped: state.onStepTapped,
        controlsBuilder: (context, {onStepCancel, onStepContinue}) {
          return Consumer<StepperController>(
            builder: (context, state, child) {
              return Row(
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
                  }
                ],
              );
            },
          );
        },
      ),
    );
  }
}
