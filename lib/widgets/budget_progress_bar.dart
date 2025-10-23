// lib/widgets/budget_progress_bar.dart
import 'package:flutter/material.dart';

class BudgetProgressBar extends StatelessWidget {
  final double percentage;
  final double amount, spent;

  const BudgetProgressBar({
    super.key,
    required this.percentage,
    required this.amount,
    required this.spent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: percentage / 100,
          backgroundColor: Colors.grey[300],
          color: percentage > 90 ? Colors.red : Colors.green,
        ),
        const SizedBox(height: 4),
        Text(
          'Rp${spent.toStringAsFixed(0)} / Rp${amount.toStringAsFixed(0)}',
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}