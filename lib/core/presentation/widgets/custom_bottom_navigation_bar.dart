import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Handle FAB action
        },
        backgroundColor: Theme.of(context).primaryColor,
        elevation: ElevationConstants.small,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: const Icon(Icons.add, color: ColorConstants.primaryWhite),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        color: ColorConstants.backgroundNavigationBar,
        child: SizedBox(
          height: SizeConstants.navigationBarSize,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.style, TextConstans.decks, 0),
              _buildNavItem(Icons.search_outlined, TextConstans.discover, 1),
              _buildNavItem(Icons.bar_chart_outlined, TextConstans.stats, 2),
              _buildNavItem(Icons.person_outline, TextConstans.profile, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: SpacingConstants.xs,
        children: [
          Icon(
            icon,
            color: isSelected
                ? Theme.of(context).primaryColor
                : ColorConstants.iconNotSelected,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: TextSizeConstants.caption,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : ColorConstants.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
