import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/search/presentation/widgets/headline_search_widget.dart';
import 'package:wize_cards/features/search/presentation/widgets/search_textfield_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingConstants.medium,
          ),
          child: Column(
            spacing: SpacingConstants.medium,
            children: [
              HeadlineSearchWidget(onPressed: () {}),
              SearchTextfieldWidget(onSettingsPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
