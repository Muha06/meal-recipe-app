import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }
}
