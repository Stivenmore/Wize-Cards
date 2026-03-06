import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wize_cards/core/utils/constant.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: SpacingConstants.medium,
      children: [
        Expanded(
          child: Divider(
            thickness: ThicknessConstans.xs,
            color: Theme.of(context).dividerColor,
          ),
        ),
        Text(
          TextConstans.orDivider,
          style: GoogleFonts.inter(
            fontSize: TextSizeConstants.body,
            color: Theme.of(context).dividerColor,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: ThicknessConstans.xs,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ],
    );
  }
}
