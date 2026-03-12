import 'package:flutter/material.dart';
import 'package:wize_cards/features/search/presentation/widgets/headline_search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [HeadlineSearchWidget()])),
    );
  }
}
