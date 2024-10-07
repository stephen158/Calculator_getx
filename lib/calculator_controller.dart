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
    _secondOperand = double.tryParse(displayText.value) ?? 0;
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
    displayText.value = '0';
  }

  void _appendNumber(String number) {
    if (displayText.value == '0' && number != '.') {
      displayText.value = number;
    } else {
      displayText.value += number;
    }
  }
}
