import 'package:calulator/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../logic/calculator_logic.dart';
import '../models/calculator_state.dart';

class CalculatorDisplay extends StatelessWidget {
  final CalculatorState state;
  final CalculatorTheme theme;

  const CalculatorDisplay({
    super.key,
    required this.state,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (state.memory != 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "M",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          const SizedBox(height: 8),
          // Current operation display
          if (state.operation != null && state.previousValue != null)
            Text(
              "${CalculatorLogic.formatDisplay(state.previousValue!)} ${state.operation}",
              style: TextStyle(color: theme.currentOpTextColor, fontSize: 20),
            ),
          const SizedBox(height: 8),
          // Main display
          SizedBox(
            // changed this from Container
            width: double.infinity,
            child: Text(
              state.display,
              style: TextStyle(
                color: theme.textColor,
                fontSize: _getFontSize(state.display.length),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  double _getFontSize(int length) {
    if (length <= 8) return 48;
    if (length <= 10) return 40;
    if (length <= 12) return 32;
    return 24;
  }
}
