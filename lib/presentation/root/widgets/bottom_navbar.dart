import 'package:flutter/material.dart';

class MaterialBottomNav extends StatelessWidget {
  static final ValueNotifier<int> currentSelectedIndexNotifier =
      ValueNotifier(0);
  final List<NavigationDestination> destinations;
  final NavigationDestinationLabelBehavior? labelBehavior;
  final void Function(int index) onItemTap;
  final Color? backgroundColor;

  const MaterialBottomNav({
    Key? key,
    required this.onItemTap,
    required this.destinations,
    this.backgroundColor,
    this.labelBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: currentSelectedIndexNotifier,
        builder: (BuildContext context, int newIndex, Widget? _) {
          return NavigationBar(
            //animationDuration: const Duration(seconds: 2),
            labelBehavior: labelBehavior,
            backgroundColor: backgroundColor,
            selectedIndex: newIndex,
            onDestinationSelected: (int tappedIndex) {
              onItemTap(tappedIndex);
            },
            destinations: destinations,
          );
        });
  }
}
