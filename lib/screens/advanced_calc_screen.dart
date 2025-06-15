// FILE: advanced_calc_screen.dart
import 'package:flutter/material.dart';
import 'package:calculator/widgets/advanced_calc_widget.dart';
import 'package:calculator/screens/advanced_calc_logic.dart';

class AdvancedCalcScreen extends StatefulWidget {
  const AdvancedCalcScreen({super.key});

  @override
  State<AdvancedCalcScreen> createState() => _AdvancedCalcScreenState();
}

class _AdvancedCalcScreenState extends State<AdvancedCalcScreen> {
  final calc = AdvancedCalcLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: AdvancedCalcWidget(
          onMenuTap: () => Navigator.pop(context),
          display: calc.displayText,
          onButtonPressed: (label) {
            setState(() {
              calc.onButtonPressed(label);
            });
          },
        ),
      ),
    );
  }
}
