import 'package:flutter/material.dart';

class AdvancedCalcWidget extends StatelessWidget {
  final VoidCallback onMenuTap;

  const AdvancedCalcWidget({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Menu Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onMenuTap,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu,
                    color: Color(0xFFFF9500),
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Display
        const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              '0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),

        const Divider(color: Colors.white30),

        // Calculator Buttons
        Expanded(
          child: Column(
            children: [
              _buildRow(['(', ')', 'mc', 'm+', 'm-', 'mr']),
              _buildRow(['2ⁿᵈ', 'x²', 'x³', 'xʸ', 'eˣ', '10ˣ']),
              _buildRow(['1/x', '√x', '∛x', 'ʸ√x', 'ln', 'log₁₀']),
              _buildRow(['x!', 'sin', 'cos', 'tan', 'e', 'EE']),
              _buildRow(['Rand', 'sinh', 'cosh', 'tanh', 'π', 'Deg']),
              _buildRow(['AC', '+/-', '%', '÷'], highlightOrange: [3]),
              _buildRow(['7', '8', '9', '×'], highlightOrange: [3]),
              _buildRow(['4', '5', '6', '-'], highlightOrange: [3]),
              _buildRow(['1', '2', '3', '+'], highlightOrange: [3]),
              _buildRowWithIcons(
                [Icons.calculate, '0', '.', '='],
                highlightOrange: [3],
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _buildRow(
    List<String> labels, {
    List<int> highlightOrange = const [],
  }) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: labels.asMap().entries.map((entry) {
          int index = entry.key;
          String label = entry.value;
          bool isOrange = highlightOrange.contains(index) || ['+', '-', '×', '÷', '='].contains(label);

          return _buildButton(label, isOrange);
        }).toList(),
      ),
    );
  }

  static Widget _buildRowWithIcons(
    List<dynamic> items, {
    List<int> highlightOrange = const [],
  }) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.asMap().entries.map((entry) {
          int index = entry.key;
          var item = entry.value;
          bool isIcon = item is IconData;
          bool isOrange = highlightOrange.contains(index) || item == '=';

          return Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              height: 50,
              decoration: BoxDecoration(
                color: isOrange ? const Color(0xFFFF9500) : Colors.grey.shade900,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Center(
                child: isIcon
                    ? Icon(item, color: Colors.white, size: 20)
                    : Text(
                        item,
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  static Widget _buildButton(String text, bool isOrange) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 50,
        decoration: BoxDecoration(
          color: isOrange ? const Color(0xFFFF9500) : Colors.grey.shade900,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
