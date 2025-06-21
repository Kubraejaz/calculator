import 'package:get/get.dart';

class HistoryController extends GetxController {
  var history = <String>[].obs;

  void addToHistory(String expression, String result) {
    history.add('$expression = $result');
  }

  void clearHistory() {
    history.clear();
  }
}
