import 'package:flutter/material.dart';

class DeckIconWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color containerColor;
  final double containerOpacity;

  const DeckIconWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.containerColor,
    required this.containerOpacity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: containerColor.withOpacity(containerOpacity),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(icon, color: iconColor),
    );
  }
}
