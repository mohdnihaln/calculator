import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  // Observables for the current input and result
  var input = ''.obs;
  var result = '0'.obs;

  // Append a character to the input
  void appendInput(String value) {
    input.value += value;
  }

  // Clear the input and result
  void clear() {
    input.value = '';
    result.value = '0';
  }

  void clearAll() {
    input.value = '';
    result.value = '0';
  }

  void backspace() {
    if (input.value.isNotEmpty) {
      input.value = input.value.substring(0, input.value.length - 1);
    }
  }

void calculate() {
  try {
    // Replace 'x' with '*' for multiplication
    String expression = input.value.replaceAll('x', '*');

    // Parse and evaluate the expression
    Parser parser = Parser();
    Expression exp = parser.parse(expression);
    ContextModel cm = ContextModel();
    var eval = exp.evaluate(EvaluationType.REAL, cm);

    // Update the result
    result.value = eval.toString();
  } catch (e) {
    result.value = '0';
  }
}
}