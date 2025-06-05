import 'package:flutter/material.dart';
import 'package:calculator/constants/colors.dart';
import 'package:calculator/screens/advanced_calc_screen.dart';
import 'package:calculator/screens/history_screen.dart';
import 'package:calculator/widgets/home_widget.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _input = '';
  String _result = '';
  bool _calculated = false;

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _result = '';
        _calculated = false;
      } else if (value == '=') {
        _calculateResult();
        _calculated = true;
      } else if (value == '+/-') {
        _toggleSign();
        _calculated = false;
      } else if (value == '%') {
        if (_calculated) {
          _input = value;
          _result = '';
          _calculated = false;
        } else {
          _input += value;
        }
      } else {
        if (_calculated) {
          _input = value;
          _result = '';
          _calculated = false;
        } else {
          _input += value;
        }
      }
    });
  }

  void _calculateResult() {
    try {
      String expression = _input.replaceAll('×', '*').replaceAll('÷', '/');
      expression = expression.replaceAllMapped(RegExp(r'(\d+)%'), (match) {
        return '(${match[1]}*0.01)';
      });

      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      _result = eval.toString();
      _input = _result;
    } catch (e) {
      _result = 'Error';
      _input = '';
    }
  }

  void _toggleSign() {
    if (_input.isEmpty) return;
    try {
      double currentValue = double.parse(_input);
      currentValue = -currentValue;
      _input = currentValue.toString();
      _result = _input;
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.googleBlack,
      body: HomeWidget(
        input: _input,
        result: _result,
        calculated: _calculated,
        onButtonPressed: _onButtonPressed,
        onAdvancedPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AdvancedCalcScreen()),
          );
        },
        onHistoryPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const HistoryScreen()),
          );
        },
      ),
    );
  }
}
