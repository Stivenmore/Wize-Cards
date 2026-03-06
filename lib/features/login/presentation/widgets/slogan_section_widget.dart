import 'package:flutter/material.dart';
import 'package:wize_cards/core/presentation/widgets/icon_app_widget.dart';
import 'package:wize_cards/core/presentation/widgets/or_divider_widget.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/login/presentation/constants/login_screen_constants.dart';

class SloganSectionWidget extends StatelessWidget {
  const SloganSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SpacingConstants.large,
      children: [
        IconAppWidget(
          assetPath: IconAppType.outlined,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: Offset(0, 6),
              color: Theme.of(context).shadowColor,
            ),
          ],
        ),
        Text(
          AppConstants.appName,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        Text(
          LoginScreenConstants.slogan,
          style: Theme.of(context).textTheme.labelSmall,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        OrDividerWidget()
      ],
    );
  }
}
