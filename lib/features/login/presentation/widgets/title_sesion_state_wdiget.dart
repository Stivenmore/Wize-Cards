import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';

class TitleSesionStateWdiget extends StatelessWidget {
  final String title;

  const TitleSesionStateWdiget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SpacingConstants.xs),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: TextSizeConstants.caption,
              fontWeight: .bold,
              letterSpacing: 1.0,
            ),
          ),
          Row(
            mainAxisAlignment: .center,
            spacing: SpacingConstants.small,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                "Live Session",
                style: TextStyle(
                  fontSize: TextSizeConstants.caption,
                  fontWeight: .bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
