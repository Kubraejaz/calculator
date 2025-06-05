import 'package:calculator/widgets/advanced_calc_widget.dart';
import 'package:flutter/material.dart';

class AdvancedCalcScreen extends StatelessWidget {
  const AdvancedCalcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: AdvancedCalcWidget(onMenuTap: () => Navigator.pop(context)),
      ),
    );
  }
}
