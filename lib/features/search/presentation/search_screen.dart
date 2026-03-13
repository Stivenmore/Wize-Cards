import 'package:flutter/material.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/search/presentation/contanstants/search_constants.dart';
import 'package:wize_cards/features/search/presentation/widgets/discover_choice_chip_widget.dart';
import 'package:wize_cards/features/search/presentation/widgets/discover_deck_card_widget.dart';
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
              Align(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: SpacingConstants.xs,
                    children: List.generate(SearchConstants.filters.length, (
                      index,
                    ) {
                      return DiscoverChoiceChipWidget(
                        label: Text(SearchConstants.filters[index]),
                        selected: index == 0,
                        onSelected: (value) {},
                      );
                    }),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: SpacingConstants.medium,
                    crossAxisSpacing: SpacingConstants.medium,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return DiscoverDeckCardWidget(
                      title: "Business English B2",
                      subtitle: "40 cards",
                      icon: Icons.translate,
                      iconColor: Colors.orange,
                      onTap: () {},
                      onDownload: () {},
                    );
                  },
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(SearchConstants.viewMoreDecks),
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
