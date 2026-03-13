import 'package:flutter/material.dart';
import 'package:wize_cards/core/presentation/widgets/buttons/ds_circular_icon_button_widget.dart';
import 'package:wize_cards/features/search/presentation/contanstants/search_constants.dart';

/// A widget that displays a main search screen headline and a notification button.
///
/// This widget typically appears at the top of the search or discover screen.
/// It displays a title defined by [SearchConstants.headline] and a circular
/// icon button for notifications.
class HeadlineSearchWidget extends StatelessWidget {
  const HeadlineSearchWidget({super.key, required this.onPressed});

  /// The callback that is called when the notification button is tapped.
  final VoidCallback onPressed;

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
        DsCircularIconButtonWidget(
          onPressed: onPressed,
          icon: Icons.notifications_none_outlined,
          primary: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
