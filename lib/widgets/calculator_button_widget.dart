import 'package:flutter/material.dart';

import '../models/button_type.dart';
import '../models/calculator_button.dart';
import '../models/calculator_state.dart';

class CalculatorButtonWidget extends StatelessWidget {
  final CalculatorButton button;
  final CalculatorState state;
  final VoidCallback onPressed;

  const CalculatorButtonWidget({
    required this.button,
    required this.state,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isPressed = state.operation == button.value;

    return Container(
      margin: const EdgeInsets.all(4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            decoration: BoxDecoration(
              color: isPressed
                  ? Colors.white
                  : button.color ?? _getDefaultButtonColor(button.type),
              borderRadius: BorderRadius.circular(50),
              border: isPressed
                  ? Border.all(color: Colors.orange, width: 2)
                  : null,
            ),
            child: Center(
              child: Text(
                button.text,
                style: TextStyle(
                  color: isPressed
                      ? Colors.orange
                      : button.textColor ?? Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getDefaultButtonColor(ButtonType type) {
    switch (type) {
      case ButtonType.number:
        return Colors.grey[800]!;
      case ButtonType.operation:
        return Colors.orange;
      case ButtonType.function:
      case ButtonType.utility:
        return Colors.grey[600]!;
      case ButtonType.memory:
        return Colors.blue[700]!;
    }
  }
}
