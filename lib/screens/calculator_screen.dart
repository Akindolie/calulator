import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../logic/calculator_logic.dart';
import '../models/calculator_state.dart';
import '../theme/app_theme.dart';
import '../widgets/calculator_display.dart';
import '../widgets/calculator_history.dart';
import '../widgets/calculator_keypad.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  CalculatorAppState createState() => CalculatorAppState();
}

class CalculatorAppState extends State<CalculatorApp> {
  CalculatorTheme _theme = CalculatorTheme.dark;
  CalculatorState _state = const CalculatorState();
  bool _showHistory = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  void _toggleTheme() {
    setState(() {
      _theme = _theme == CalculatorTheme.dark
          ? CalculatorTheme.light
          : CalculatorTheme.dark;
    });
  }

  void _onButtonPressed(String value) {
    setState(() {
      print("state => ${_state.operation}");
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

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) {
      final key = event.logicalKey;

      // Number keys
      if (key.keyId >= LogicalKeyboardKey.digit0.keyId &&
          key.keyId <= LogicalKeyboardKey.digit9.keyId) {
        final digit = (key.keyId - LogicalKeyboardKey.digit0.keyId).toString();
        _handleButtonPress(digit);
        return KeyEventResult.handled;
      }

      // Operation keys
      switch (key.keyLabel) {
        case "+":
          _handleButtonPress("+");
          return KeyEventResult.handled;
        case "-":
          _handleButtonPress("-");
          return KeyEventResult.handled;
        case "*":
          _handleButtonPress("×");
          return KeyEventResult.handled;
        case "/":
          _handleButtonPress("÷");
          return KeyEventResult.handled;
        case "=":
        case "Enter":
          _handleButtonPress("=");
          return KeyEventResult.handled;
        case ".":
          _handleButtonPress(".");
          return KeyEventResult.handled;
        case "Escape":
          _handleButtonPress("C");
          return KeyEventResult.handled;
        case "Backspace":
          _handleButtonPress("CE");
          return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }

  void _handleButtonPress(String value) {
    HapticFeedback.lightImpact();
    setState(() {
      print("I got here");
      _state = CalculatorLogic.processInput(_state, value);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Focus(
        focusNode: _focusNode,
        onKeyEvent: _handleKeyEvent,
        autofocus: true,
        child: SafeArea(
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
