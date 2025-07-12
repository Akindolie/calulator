import 'package:flutter/material.dart';

class CalculatorTheme {
  final Color backgroundColor;
  final Color displayColor;
  final Color numberButtonColor;
  final Color operationButtonColor;
  final Color textColor;
  final Color scientificOpButtonColor;
  final Color currentOpTextColor;

  const CalculatorTheme({
    required this.backgroundColor,
    required this.displayColor,
    required this.numberButtonColor,
    required this.operationButtonColor,
    required this.textColor,
    required this.scientificOpButtonColor,
    required this.currentOpTextColor,
  });

  static const CalculatorTheme dark = CalculatorTheme(
    backgroundColor: Colors.black,
    displayColor: Colors.white,
    numberButtonColor: Color(0xFF333333),
    operationButtonColor: Colors.orange,
    scientificOpButtonColor: Colors.green,
    textColor: Colors.white,
    currentOpTextColor: Colors.grey,
  );

  static const CalculatorTheme light = CalculatorTheme(
    backgroundColor: Colors.white,
    displayColor: Colors.black,
    numberButtonColor: Color(0xFFF0F0F0),
    operationButtonColor: Colors.blue,
    textColor: Colors.black,
    scientificOpButtonColor: Colors.green,
    currentOpTextColor: Colors.black,
  );
}
