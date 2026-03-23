import 'dart:ui';

class BadgeModel {
  final String iconPath;
  final String label;
  final Color color;
  final List<Color> gradientColors;
  final bool isUnlocked;

  const BadgeModel({
    required this.iconPath,
    required this.label,
    required this.color,
    required this.gradientColors,
    this.isUnlocked = false,
  });
}
