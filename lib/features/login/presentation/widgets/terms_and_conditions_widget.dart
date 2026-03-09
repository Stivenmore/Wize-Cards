import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/login/presentation/constants/login_screen_constants.dart';
import 'package:wize_cards/features/login/presentation/widgets/wize_text_button_widget.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          LoginScreenConstants.termsMessage,
          style: TextStyle(
            color: ColorConstants.subtitle,
            fontSize: TextSizeConstants.caption,
          ),
        ),
        WizeTextButtonWidget(),
      ],
    );
  }
}