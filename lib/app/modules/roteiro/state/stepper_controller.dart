import 'package:flutter/material.dart';

class StepperController extends ChangeNotifier {
  int _currentStep = 0;
  final int length;

  StepperController({@required this.length});

  int get currentStep => _currentStep;

  bool get isFirst => _currentStep == 0;

  bool get isLast => _currentStep + 1 == length;

  void onStepContinue() {
    if (_currentStep + 1 < length) {
      _currentStep += 1;
      notifyListeners();
    }
  }

  void onStepCancel() {
    if (_currentStep > 0) {
      this._currentStep -= 1;
      notifyListeners();
    }
  }

  void onStepTapped(int step) {
    _currentStep = step;
    notifyListeners();
  }

}
