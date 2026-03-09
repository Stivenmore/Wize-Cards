import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/login/presentation/constants/login_screen_constants.dart';

class WizeTextButtonWidget extends StatelessWidget {
  final String redirectionString;
  final String message;
  final TextStyle? style;

  const WizeTextButtonWidget({
    super.key,
    this.redirectionString = AppConstants.apiBaseUrl,
    this.message = LoginScreenConstants.termsLink,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(
      color: ColorConstants.subtitle,
      fontSize: TextSizeConstants.caption,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold,
    );
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {
        final Uri url = Uri.parse(redirectionString);
        launchUrl(url);
      },
      child: Text(
        message,
        style: style ?? defaultStyle
      ),
    );
  }
}