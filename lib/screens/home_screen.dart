import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator/constants/colors.dart';
import 'package:calculator/logics/home_logic.dart';
import 'package:calculator/screens/advanced_calc_screen.dart';
import 'package:calculator/screens/history_screen.dart';
import 'package:calculator/widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeLogic controller = Get.put(HomeLogic());

    return Scaffold(
      backgroundColor: AppColors.googleBlack,
      body: Obx(
        () => HomeWidget(
          input: controller.input.value,
          result: controller.result.value,
          calculated: controller.calculated.value,
          onButtonPressed: controller.onButtonPressed,
          onAdvancedPressed: controller.clearStep,
          onHistoryPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HistoryScreen()),
            );
          },
          onNavigateToAdvancedScreen: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AdvancedCalcScreen()),
            );
          },
        ),
      ),
    );
  }
}
