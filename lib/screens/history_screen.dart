import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator/widgets/history_widget.dart';
import 'package:calculator/controllers/history_controller.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryController historyController = Get.find<HistoryController>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Obx(
          () => HistoryWidget(
            onBackTap: () => Navigator.pop(context),
            historyList:
                historyController.history
                    .toList(), 
            onClearTap: historyController.clearHistory,
          ),
        ),
      ),
    );
  }
}
