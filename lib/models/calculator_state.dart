import 'calculation_history.dart';

class CalculatorState {
  final String display;
  final double? currentValue;
  final double? previousValue;
  final String? operation;
  final bool shouldResetDisplay;
  final double memory;
  final List<CalculationHistory> history;

  const CalculatorState({
    this.display = "0",
    this.currentValue,
    this.previousValue,
    this.operation,
    this.shouldResetDisplay = false,
    this.memory = 0,
    this.history = const [],
  });

  CalculatorState copyWith({
    String? display,
    double? currentValue,
    double? previousValue,
    String? operation,
    bool? shouldResetDisplay,
    double? memory,
    List<CalculationHistory>? history,
  }) {
    return CalculatorState(
      display: display ?? this.display,
      currentValue: currentValue ?? this.currentValue,
      previousValue: previousValue ?? this.previousValue,
      operation: operation ?? this.operation,
      shouldResetDisplay: shouldResetDisplay ?? this.shouldResetDisplay,
      memory: memory ?? this.memory,
      history: history ?? this.history,
    );
  }
}
