import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/controllers/history_controller.dart';

class HomeLogic extends GetxController {
  final RxString input = ''.obs;
  final RxString result = ''.obs;
  final RxBool calculated = false.obs;

  final HistoryController historyController = Get.put(HistoryController(), permanent: true);

  void onButtonPressed(String value) {
    if (value == 'AC') {
      clear();
    } else if (value == '=') {
      calculateResult();
    } else if (value == '+/-') {
      toggleSign();
    } else if (value == '%') {
      input.value += value;
    } else {
      if (calculated.value) {
        input.value = value;
        result.value = '';
        calculated.value = false;
      } else {
        input.value += value;
      }
    }
  }

  void clear() {
    input.value = '';
    result.value = '';
    calculated.value = false;
  }

  void clearStep() {
    if (input.value.isNotEmpty) {
      input.value = input.value.substring(0, input.value.length - 1);
      result.value = '';
      calculated.value = false;
    }
  }

  void calculateResult() {
    try {
      String expression = input.value.replaceAll('×', '*').replaceAll('÷', '/');
      expression = expression.replaceAllMapped(RegExp(r'(\d+)%'), (match) {
        return '(${match[1]}*0.01)';
      });

      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      result.value = eval.toString();
      historyController.addToHistory(input.value, result.value);
      input.value = result.value;
      calculated.value = true;
    } catch (_) {
      result.value = 'Error';
      input.value = '';
    }
  }

  void toggleSign() {
    if (input.value.isEmpty) return;
    try {
      double currentValue = double.parse(input.value);
      currentValue = -currentValue;
      input.value = currentValue.toString();
      result.value = input.value;
    } catch (_) {}
  }
}
