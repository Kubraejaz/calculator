import 'dart:math';
import 'package:math_expressions/math_expressions.dart';

class AdvancedCalcLogic {
  String _expression = '';
  String _result = '0';
  double? memory;
  bool _isDegree = true;

  String get displayText => _expression.isEmpty ? _result : _expression;

  void onButtonPressed(String input) {
    switch (input) {
      case 'AC':
        _clearAll();
        break;
      case '⌫':
        _deleteLast();
        break;
      case '+/-':
        _toggleSign();
        break;
      case '%':
        _evaluate();
        _evaluateFunc((x) => x / 100);
        break;
      case '=':
        _evaluate();
        break;
      case 'mc':
        memory = null;
        break;
      case 'm+':
        memory = (memory ?? 0) + (double.tryParse(_result) ?? 0);
        break;
      case 'm-':
        memory = (memory ?? 0) - (double.tryParse(_result) ?? 0);
        break;
      case 'mr':
        _expression += memory?.toString() ?? '0';
        break;
      case ',':
        _expression += ',';
        break;
      case 'x²':
        _evaluate();
        _evaluateFunc((x) => pow(x, 2).toDouble());
        break;
      case 'x³':
        _evaluate();
        _evaluateFunc((x) => pow(x, 3).toDouble());
        break;
      case 'xʸ':
        _expression += '^';
        break;
      case 'eˣ':
        _expression += 'e^';
        break;
      case '10ˣ':
        _expression += '10^';
        break;
      case 'EE':
        _expression += 'E';
        break;
      case '1/x':
        _evaluate();
        _evaluateFunc((x) => 1 / x);
        break;
      case '√x':
        _evaluate();
        _evaluateFunc((x) => sqrt(x));
        break;
      case '∛x':
        _evaluate();
        _evaluateFunc((x) => pow(x, 1 / 3).toDouble());
        break;
      case 'ʸ√x':
        _expression += 'root(';
        break;
      case 'ln':
        _evaluate();
        _evaluateFunc((x) => log(x));
        break;
      case 'log₁₀':
        _evaluate();
        _evaluateFunc((x) => log(x) / ln10);
        break;
      case 'x!':
        _evaluate();
        _evaluateFunc((x) => _factorial(x.toInt()).toDouble());
        break;
      case 'sin':
        _evaluate();
        _evaluateFunc(_applyTrig((x) => sin(x)));
        break;
      case 'cos':
        _evaluate();
        _evaluateFunc(_applyTrig((x) => cos(x)));
        break;
      case 'tan':
        _evaluate();
        _evaluateFunc(_applyTrig((x) => tan(x)));
        break;
      case 'sinh':
        _evaluate();
        _evaluateFunc((x) => (exp(x) - exp(-x)) / 2);
        break;
      case 'cosh':
        _evaluate();
        _evaluateFunc((x) => (exp(x) + exp(-x)) / 2);
        break;
      case 'tanh':
        _evaluate();
        _evaluateFunc((x) => (exp(x) - exp(-x)) / (exp(x) + exp(-x)));
        break;
      case 'Rand':
        _expression += Random().nextDouble().toStringAsFixed(4);
        break;
      case 'π':
        _expression += pi.toString();
        break;
      case 'e':
        if (_expression.isNotEmpty && RegExp(r'\d$').hasMatch(_expression)) {
          _expression += '*${e.toString()}';
        } else {
          _expression += e.toString();
        }
        break;
      case 'Deg':
        _isDegree = !_isDegree;
        break;
      default:
        _expression += input;
        break;
    }
  }

  void _clearAll() {
    _expression = '';
    _result = '0';
  }

  void _deleteLast() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
    }
  }

  void _toggleSign() {
    if (_expression.startsWith('-')) {
      _expression = _expression.substring(1);
    } else {
      _expression = '-$_expression';
    }
  }

  void _evaluateFunc(double Function(double) func) {
    try {
      double x = double.parse(_result);
      double value = func(x);
      _result = value.toStringAsFixed(5);
      _expression = _result;
    } catch (_) {
      _expression = '';
      _result = 'Error';
    }
  }

  void _evaluate() {
    try {
      String exp = _expression
          .replaceAll('×', '*')
          .replaceAll('÷', '/')
          .replaceAll('E', 'e');

      // Convert root(y,x) => (x)^(1/y)
      final rootRegex = RegExp(r'root\s*\(\s*([^)]+?)\s*,\s*([^)]+?)\s*\)');
      exp = exp.replaceAllMapped(rootRegex, (match) {
        final y = match.group(1);
        final x = match.group(2);
        return '($x)^(1/($y))';
      });

      Parser p = Parser();
      Expression ex = p.parse(exp);
      ContextModel cm = ContextModel();

      double val = ex.evaluate(EvaluationType.REAL, cm);
      _result = val.toStringAsFixed(6).replaceAll(RegExp(r'\.?0+$'), '');
      _expression = _result;
    } catch (_) {
      _expression = '';
      _result = 'Error';
    }
  }

  double Function(double) _applyTrig(double Function(double) trigFn) {
    return (x) {
      double angle = _isDegree ? x * (pi / 180) : x;
      return trigFn(angle);
    };
  }

  int _factorial(int n) {
    if (n < 0) throw ArgumentError('Negative factorial is undefined');
    if (n == 0 || n == 1) return 1;
    int result = 1;
    for (int i = 2; i <= n; i++) {
      result *= i;
    }
    return result;
  }
}
