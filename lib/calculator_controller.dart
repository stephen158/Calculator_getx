import 'dart:ffi';

import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var displayText = '0'.obs;
  String _operation = '';
  double _firstOperand = 0;
  double _secondOperand = 0;

  void onButtonClick(String value) {
    if (value == 'C') {
      clear();
    } else if (value == '=') {
      calculate();
    } else if (value == '+' || value == '-' || value == '*' || value == '/') {
      _setOperation(value);
    } else {
      _appendNumber(value);
    }
  }

  void clear() {
    displayText.value = '0';
    _firstOperand = 0;
    _secondOperand = 0;
    _operation = '';
  }

  void calculate() {
    String display = displayText.value;
    if (_operation.isNotEmpty) {
      final parts = display.split(RegExp(r'[+\-*/]'));
      if (parts.length > 1) {
        _secondOperand = double.parse(parts[1]);
      }
    }

    double result;

    switch (_operation) {
      case '+':
        result = _firstOperand + _secondOperand;
        break;
      case '-':
        result = _firstOperand - _secondOperand;
        break;
      case '*':
        result = _firstOperand * _secondOperand;
        break;
      case '/':
        result = _firstOperand / _secondOperand;
        break;
      default:
        result = 0;
    }

    displayText.value = result.toString();
    _operation = '';
    _firstOperand = result;
  }

  void _setOperation(String operation) {
    _firstOperand = double.tryParse(displayText.value) ?? 0;
    _operation = operation;
    displayText.value += _operation;
  }

  void _appendNumber(String number) {
    if (displayText.value == '0' && number != '.') {
      displayText.value = number;
    } else {
      displayText.value += number;
    }
  }
}
