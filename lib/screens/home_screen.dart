import 'package:calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '0',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            const Divider(color: Colors.white38),

            _buildButtonRow(['C', '+/-', '%', '÷'], Colors.grey),
            _buildButtonRow(['7', '8', '9', '×'], Colors.grey.shade800),
            _buildButtonRow(['4', '5', '6', '-'], Colors.grey.shade800),
            _buildButtonRow(['1', '2', '3', '+'], Colors.grey.shade800),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: const Center(
                          child: Icon(Icons.calculate, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  Expanded(child: _calculatorButton('0', Colors.grey.shade800)),

                  Expanded(child: _calculatorButton('.', Colors.grey.shade800)),

                  Expanded(
                    child: _calculatorButton('=', AppColors.googleOrange),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            buttons
                .map(
                  (text) => Expanded(
                    child: _calculatorButton(
                      text,
                      text == '=' ||
                              text == '+' ||
                              text == '-' ||
                              text == '×' ||
                              text == '÷'
                          ? AppColors.googleOrange
                          : color,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _calculatorButton(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
