import 'package:flutter/material.dart';
import 'package:wize_cards/core/presentation/widgets/buttons/ds_circular_icon_button_widget.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/deck/constanst/deck_screen_constant.dart';
import 'package:wize_cards/features/deck/widgets/title_sesion_state_widget.dart';

class StudyHeaderWidget extends StatelessWidget {
  final double progress;
  final double maxValue;
  final VoidCallback onBackPressed;
  final VoidCallback onSettingsPressed;
  const StudyHeaderWidget({
    super.key,
    required this.progress,
    required this.maxValue,
    required this.onBackPressed,
    required this.onSettingsPressed
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final normalizedProgress = (progress / maxValue).clamp(0.0, 1.0);

    return Column(
      children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              DsCircularIconButtonWidget(
                onPressed: onBackPressed,
                icon: Icons.arrow_back,
                primary: theme.colorScheme.primary,
                backgroundColor: Colors.white,
              ),
              TitleSesionStateWidget(title: DeckScreenConstants.sessionStateTitle),
              DsCircularIconButtonWidget(
                onPressed: onSettingsPressed,
                icon: Icons.settings_outlined,
                primary: theme.colorScheme.primary,
                backgroundColor: Colors.white,
              ),
            ],
          ),
        SizedBox(
          height: SpacingConstants.medium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SpacingConstants.small),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    DeckScreenConstants.progress,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: TextSizeConstants.caption,
                      color: theme.shadowColor
                    ),
                  ),
                  Text(
                    "${progress.toInt()} / ${maxValue.toInt()}",
                     style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: TextSizeConstants.body,
                      color: Colors.blue
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: SpacingConstants.xs,
              ),
              LinearProgressIndicator(
                minHeight: ThicknessConstans.md,
                value: normalizedProgress,
                backgroundColor: theme.shadowColor,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                borderRadius: BorderRadius.circular(
                  BorderRadiusConstants.large,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}