import 'package:flutter/material.dart';

import '../models/calculation_history.dart';

class CalculatorHistory extends StatelessWidget {
  final List<CalculationHistory> history;
  final VoidCallback onClear;
  final Function(String result) onTapItem;

  const CalculatorHistory({
    super.key,
    required this.history,
    required this.onClear,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              "No calculations yet",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Clear history button
        Container(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: onClear,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Clear History"),
          ),
        ),
        // History list
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: history.length,
            itemBuilder: (context, index) {
              final item = history[history.length - 1 - index];
              return UseHistoryResult(item: item, onTapItem: onTapItem);
            },
          ),
        ),
      ],
    );
  }
}

class UseHistoryResult extends StatelessWidget {
  const UseHistoryResult({
    super.key,
    required this.item,
    required this.onTapItem,
  });

  final CalculationHistory item;
  final Function(String result) onTapItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      color: Colors.grey[850],
      child: ListTile(
        title: Text(item.expression, style: TextStyle(color: Colors.grey[300])),
        subtitle: Text(
          "= ${item.result}",
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        trailing: Text(
          "${item.timestamp.hour.toString().padLeft(2, '0')}:${item.timestamp.minute.toString().padLeft(2, '0')}",
          style: const TextStyle(color: Colors.grey),
        ),
        onTap: () => onTapItem(item.result),
      ),
    );
  }
}
