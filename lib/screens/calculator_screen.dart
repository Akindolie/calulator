import 'package:flutter/material.dart';

import '../logic/calculator_logic.dart';
import '../models/calculator_state.dart';
import '../widgets/calculator_display.dart';
import '../widgets/calculator_history.dart';
import '../widgets/calculator_keypad.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  CalculatorState _state = const CalculatorState();
  bool _showHistory = false;

  void _onButtonPressed(String value) {
    setState(() {
      _state = CalculatorLogic.processInput(_state, value);
    });
  }

  void _clearHistory() {
    setState(() {
      _state = _state.copyWith(history: []);
    });
  }

  void _useHistoryResult(String result) {
    final value = double.tryParse(result);
    if (value != null) {
      setState(() {
        _state = _state.copyWith(
          display: result,
          currentValue: value,
          shouldResetDisplay: true,
        );
        _showHistory = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            CalculatorDisplay(state: _state),
            _buildHistoryToggle(),
            Expanded(
              child: _showHistory
                  ? CalculatorHistory(
                      history: _state.history,
                      onClear: _clearHistory,
                      onTapItem: _useHistoryResult,
                    )
                  : CalculatorKeypad(
                      state: _state,
                      onButtonPressed: _onButtonPressed,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryToggle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _showHistory ? "Calculator" : "History (${_state.history.length})",
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
          IconButton(
            icon: Icon(
              _showHistory ? Icons.calculate : Icons.history,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _showHistory = !_showHistory;
              });
            },
          ),
        ],
      ),
    );
  }
}
