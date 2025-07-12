// Scientific calculator functions
import 'dart:math' as math;

import '../models/calculator_state.dart';
import 'calculator_logic.dart';

class ScientificCalculator extends CalculatorLogic {
  static CalculatorState handleScientificFunction(
    CalculatorState state,
    String input,
  ) {
    final current = state.currentValue ?? 0;
    double? result;
    print("INPUT2 => $input");
    switch (input) {
      case "sin":
        result = math.sin(current * math.pi / 180); // Convert to radians
        break;
      case "cos":
        result = math.cos(current * math.pi / 180);
        break;
      case "tan":
        result = math.tan(current * math.pi / 180);
        break;
      case "log":
        if (current <= 0) return state.copyWith(display: "Error");
        result = math.log(current) / math.ln10;
        break;
      case "ln":
        if (current <= 0) return state.copyWith(display: "Error");
        result = math.log(current);
        break;
      case "x²":
        print("log 2");
        print("current => $current");
        result = current * current;
        print("result1 => $result");
        break;
      case "x³":
        result = current * current * current;
        break;
      case "1/x":
        if (current == 0) return state.copyWith(display: "Error");
        result = 1 / current;
        break;
    }
    print("result2 => $result");
    if (result == null) return state;

    return state.copyWith(
      display: CalculatorLogic.formatDisplay(result),
      currentValue: result,
      shouldResetDisplay: true,
    );
  }
}
