import 'package:calculator/widgets/history_widget.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: HistoryWidget(onBackTap: () => Navigator.pop(context)),
      ),
    );
  }
}
