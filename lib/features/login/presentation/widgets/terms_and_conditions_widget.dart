import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/login/presentation/constants/login_screen_constants.dart';

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
            color: ColorConstants.hint,
            fontSize: TextSizeConstants.caption,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            final Uri url = Uri.parse(AppConstants.apiBaseUrl);
            launchUrl(url);
          },
          child: Text(
            LoginScreenConstants.termsLink,
            style: TextStyle(
              color: ColorConstants.hint,
              fontSize: TextSizeConstants.caption,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}