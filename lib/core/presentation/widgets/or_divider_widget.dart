import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({
    super.key,
    this.label = TextConstans.orDivider,
    this.spacing = SpacingConstants.medium,
  });

  final String label;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing),
      child: Row(
        spacing: spacing,
        children: [
          Expanded(
            child: Divider(height: 1, thickness: 1, color: theme.dividerColor),
          ),
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.secondary,
              letterSpacing: 0.5,
            ),
          ),
          Expanded(
            child: Divider(height: 1, thickness: 1, color: theme.dividerColor),
          ),
        ],
      ),
    );
  }
}
