import 'package:flutter/material.dart';
import 'package:calculator/constants/colors.dart';

class HomeWidget extends StatelessWidget {
  final String input;
  final String result;
  final bool calculated;
  final void Function(String) onButtonPressed;
  final VoidCallback onAdvancedPressed;
  final VoidCallback onHistoryPressed;
  final VoidCallback onNavigateToAdvancedScreen;

  const HomeWidget({
    super.key,
    required this.input,
    required this.result,
    required this.calculated,
    required this.onButtonPressed,
    required this.onAdvancedPressed,
    required this.onHistoryPressed,
    required this.onNavigateToAdvancedScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calculate_outlined, color: Colors.white),
            onPressed: onNavigateToAdvancedScreen,
          ),
          IconButton(
            icon: const Icon(Icons.history, color: Colors.white),
            onPressed: onHistoryPressed,
          ),
        ],
      ),
      body: Column(
        children: [
          const Spacer(),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  input.isEmpty ? '0' : input,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 16),
            child: Align(
              alignment: Alignment.centerRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  (result.isEmpty || result == input) ? '' : result,
                  style: TextStyle(
                    color: calculated ? Colors.white : Colors.white54,
                    fontSize: 48,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),

          const Divider(color: Colors.white38),

          _buildButtonRow(['AC', '+/-', '%', '÷'], Colors.grey),
          _buildButtonRow(['7', '8', '9', '×'], Colors.grey.shade800),
          _buildButtonRow(['4', '5', '6', '-'], Colors.grey.shade800),
          _buildButtonRow(['1', '2', '3', '+'], Colors.grey.shade800),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ⌫ Clear Step
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(35),
                      onTap: onAdvancedPressed,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.backspace,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: _calculatorButton('0', Colors.grey.shade800)),
                Expanded(child: _calculatorButton('.', Colors.grey.shade800)),
                Expanded(child: _calculatorButton('=', AppColors.googleOrange)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons
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
      child: GestureDetector(
        onTap: () => onButtonPressed(text),
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
      ),
    );
  }
}
