import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/button_type.dart';
import '../models/calculator_button.dart';
import '../models/calculator_state.dart';
import '../theme/app_theme.dart';
import 'calculator_button_widget.dart';

class CalculatorKeypad extends StatelessWidget {
  final CalculatorState state;
  final void Function(String value) onButtonPressed;
  final CalculatorTheme theme;

  const CalculatorKeypad({
    super.key,
    required this.state,
    required this.onButtonPressed,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    // Calculator button layout
    final List<List<CalculatorButton>> buttonLayout = [
      [
        CalculatorButton(text: "MC", value: "MC", type: ButtonType.memory),
        CalculatorButton(text: "MR", value: "MR", type: ButtonType.memory),
        CalculatorButton(text: "M+", value: "M+", type: ButtonType.memory),
        CalculatorButton(text: "M-", value: "M-", type: ButtonType.memory),
      ],
      [
        CalculatorButton(
          text: "sin",
          value: "sin",
          type: ButtonType.function,
          color: theme.scientificOpButtonColor,
        ),
        CalculatorButton(
          text: "cos",
          value: "cos",
          type: ButtonType.function,
          color: theme.scientificOpButtonColor,
        ),
        CalculatorButton(
          text: "tan",
          value: "tan",
          type: ButtonType.function,
          color: theme.scientificOpButtonColor,
        ),
        CalculatorButton(
          text: "log",
          value: "log",
          type: ButtonType.function,
          color: theme.scientificOpButtonColor,
        ),
      ],
      [
        CalculatorButton(
          text: "ln",
          value: "ln",
          type: ButtonType.function,
          color: theme.scientificOpButtonColor,
        ),
        CalculatorButton(
          text: "x²",
          value: "x²",
          type: ButtonType.function,
          color: theme.scientificOpButtonColor,
        ),
        CalculatorButton(
          text: "x³",
          value: "x³",
          type: ButtonType.function,
          color: theme.scientificOpButtonColor,
        ),
        CalculatorButton(
          text: "1/x",
          value: "1/x",
          type: ButtonType.function,
          color: theme.scientificOpButtonColor,
        ),
      ],
      [
        CalculatorButton(
          text: "C",
          value: "C",
          type: ButtonType.utility,
          color: Colors.red[400],
        ),
        CalculatorButton(text: "CE", value: "CE", type: ButtonType.utility),
        CalculatorButton(text: "√", value: "√", type: ButtonType.function),
        CalculatorButton(
          text: "÷",
          value: "÷",
          type: ButtonType.operation,
          color: theme.operationButtonColor,
        ),
      ],
      [
        CalculatorButton(text: "7", value: "7", type: ButtonType.number),
        CalculatorButton(text: "8", value: "8", type: ButtonType.number),
        CalculatorButton(text: "9", value: "9", type: ButtonType.number),
        CalculatorButton(
          text: "×",
          value: "×",
          type: ButtonType.operation,
          color: theme.operationButtonColor,
        ),
      ],
      [
        CalculatorButton(text: "4", value: "4", type: ButtonType.number),
        CalculatorButton(text: "5", value: "5", type: ButtonType.number),
        CalculatorButton(text: "6", value: "6", type: ButtonType.number),
        CalculatorButton(
          text: "-",
          value: "-",
          type: ButtonType.operation,
          color: theme.operationButtonColor,
        ),
      ],
      [
        CalculatorButton(text: "1", value: "1", type: ButtonType.number),
        CalculatorButton(text: "2", value: "2", type: ButtonType.number),
        CalculatorButton(text: "3", value: "3", type: ButtonType.number),
        CalculatorButton(
          text: "+",
          value: "+",
          type: ButtonType.operation,
          color: theme.operationButtonColor,
        ),
      ],
      [
        CalculatorButton(text: "±", value: "±", type: ButtonType.function),
        CalculatorButton(text: "0", value: "0", type: ButtonType.number),
        CalculatorButton(text: ".", value: ".", type: ButtonType.number),
        CalculatorButton(
          text: "=",
          value: "=",
          type: ButtonType.operation,
          color: Colors.blue,
        ),
      ],
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: buttonLayout.map((row) {
          return Expanded(
            child: Row(
              children: row.map((button) {
                return Expanded(
                  child: CalculatorButtonWidget(
                    button: button,
                    state: state,
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      onButtonPressed(button.value);
                    },
                  ),
                );
              }).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
