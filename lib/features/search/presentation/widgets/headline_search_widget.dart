import 'package:flutter/material.dart';
import 'package:wize_cards/core/presentation/widgets/icon_app_widget.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/search/presentation/contanstants/search_constants.dart';
import 'package:wize_cards/features/splash/presentation/constants/splash_screen_constants.dart';

class HeadlineSearchWidget extends StatelessWidget {
  const HeadlineSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            SearchConstants.headline,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        //TODO: Change for CircularIconWidget When available
        IconAppWidget(
          backgroundColor: SplashScreenConstants.splashColorIcon,
          assetPath: IconAppType.filled,
          size: IconSizeConstants.x24,
          borderRadius: BorderRadiusConstants.xLarge,
        ),
      ],
    );
  }
}
