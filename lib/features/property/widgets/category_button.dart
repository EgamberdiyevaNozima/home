import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String icon;
  final String label;

  const CategoryButton({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: Colors.amber[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Image.asset(icon, height: 28),
          ),
        ),
         SizedBox(height: 6),
        Text(label),
      ],
    );
  }
}
