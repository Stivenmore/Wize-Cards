import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wize_cards/features/login/presentation/constants/login_screen_constants.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: RichText(
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: const TextStyle(
            color: ColorConstants.hint, 
            fontSize: TextSizeConstants.caption,
          ),
          children: [
            TextSpan(text: LoginScreenConstants.termsMessage),
            TextSpan(
              text: LoginScreenConstants.termsLink,
              style: const TextStyle(
                color: ColorConstants.hint,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold
              ),
              recognizer: TapGestureRecognizer()
              ..onTap = () async {
                  final Uri url = Uri.parse(AppConstants.apiBaseUrl);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw "Can't open url: $url";
                  }
              },
            ),
          ],
        ), 
      ),
    );
  }
}