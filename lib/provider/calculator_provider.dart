import 'package:flutter/material.dart';

class CalculatorProvider with ChangeNotifier {
  List<String> _history = [];

  List<String> get history => _history;
  String equation = "";

  double _previousNum = 0;
  bool _isNewExpression = true;
  String _displayText = "";
  String get displayText {
    if (_displayText == "") {
      return "0";
    } else {
      return _displayText;
    }
  }

  String _prevSymbol = "";
  double get previousNum => _previousNum;

  List<String> operations = ["+", "-", "×", "÷", "=", "%"];

  void insert(String symbol) {
    if (operations.contains(symbol)) {
      handleOperation(symbol);
    } else {
      if (symbol == "AC") {
        if (!_isNewExpression) {
          _history.add(equation);
        }
        _displayText = "";
        equation = "";
        _previousNum = 0;
        _isNewExpression = true;
      } else if (operations.contains(symbol)) {
      } else if (symbol == "0") {
        if (_displayText != "0" && _displayText.isNotEmpty) {
          _displayText += symbol;
        }
      } else if (symbol == "+/-") {
        if (_displayText == "0" || _displayText == "") {
        } else if (_displayText.contains("-")) {
          _displayText = _displayText.replaceAll("-", "");
        } else {
          _displayText = "-$_displayText";
        }
      } else if (symbol == ".") {
        if (!_displayText.contains(symbol)) {
          _displayText += symbol;
        }
      } else {
        _displayText += symbol;
      }
      notifyListeners();
    }
  }

  void handleOperation(String symbol) {
    if (_isNewExpression) {
      equation += _displayText;
      equation += symbol;

      _isNewExpression = false;

      switch (symbol) {
        case "+":
          _previousNum = double.parse(_displayText);
          _displayText = "";
          _prevSymbol = "+";
          break;
        case "-":
          _previousNum = double.parse(_displayText);
          _displayText = "";
          _prevSymbol = "-";
          break;
        case "÷":
          _previousNum = double.parse(_displayText);
          _displayText = "";
          _prevSymbol = "÷";
          break;
        case "×":
          _previousNum = double.parse(_displayText);
          _displayText = "";
          _prevSymbol = "×";
          break;
        case "%":
          _previousNum = double.parse(_displayText) / 100;
          _displayText = "";
          _prevSymbol = "%";
          break;
        case "=":
          _previousNum = double.parse(_displayText);
          _displayText = "";
          break;
        default:
      }
    } else {
      equation += _displayText;
      equation += symbol;
      switch (symbol) {
        case "+":
          _previousNum = _previousNum + double.parse(_displayText);
          _displayText = "";
          _prevSymbol = "+";
          break;
        case "-":
          _previousNum = _previousNum - double.parse(_displayText);
          _displayText = "";
          _prevSymbol = "-";
          break;
        case "÷":
          _previousNum = _previousNum / double.parse(_displayText);
          _displayText = "";
          _prevSymbol = "÷";
          break;
        case "×":
          _previousNum = _previousNum * double.parse(_displayText);
          _displayText = "";
          _prevSymbol = "×";
          break;
        case "%":
          _previousNum = _previousNum / 100;
          _displayText = "";
          _prevSymbol = "%";
          break;
        case "=":
          double tempNum = double.parse(_displayText);
          switch (_prevSymbol) {
            case "+":
              _previousNum = _previousNum + double.parse(_displayText);
              break;
            case "-":
              _previousNum = _previousNum - double.parse(_displayText);
              break;
            case "÷":
              _previousNum = _previousNum / double.parse(_displayText);
              break;
            case "×":
              _previousNum = _previousNum * double.parse(_displayText);
              break;
          }
          if (symbol == "=") {
            equation += _previousNum.toString();
          }
          _displayText = "";
          break;
        default:
      }
    }

    notifyListeners();
  }

  void clearHistory() {
    _history = [];
    notifyListeners();
  }
}
