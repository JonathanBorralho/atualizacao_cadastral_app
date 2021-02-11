import 'package:flutter/material.dart';
import 'package:login_module/src/login/bloc/login_bloc.dart';
import 'package:login_module/src/login/models/login_credentials_model.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fields.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  FormGroup _formGroup;

  @override
  void initState() {
    super.initState();
    _formGroup = FormGroup({
      'matricula': FormControl<String>(validators: [Validators.required]),
      'senha': FormControl<String>(validators: [Validators.required]),
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Matrícula e/ou senha incorretas'),
            ),
          );
        }
      },
      child: ReactiveForm(
        formGroup: _formGroup,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const MatriculaFormField(),
              const SizedBox(height: 15),
              const SenhaFormField(),
              const SizedBox(height: 15),
              const SubmitFormButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SubmitFormButton extends StatelessWidget {
  const SubmitFormButton();

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, formGroup, child) {
        final bool isValid = formGroup.valid;
        return RaisedButton(
          color: Colors.blue,
          child: Text(
            'ENTRAR',
            style: const TextStyle(color: Colors.white),
          ),
          onPressed: isValid ? () async {
            context.read<LoginBloc>().add(
              LoginRequested(
                LoginCredentials(
                  formGroup.value['matricula'],
                  formGroup.value['senha'],
                )
              ),
            );
            formGroup.reset();
            formGroup.markAsUntouched();
          } : null,
        );
      },
    );
  }
}
