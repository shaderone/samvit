import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

class MaterialBottomNav extends StatelessWidget {
  static final ValueNotifier<int> currentSelectedIndexNotifier =
      ValueNotifier(0);

  final Color? backgroundColor;

  const MaterialBottomNav({
    Key? key,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: currentSelectedIndexNotifier,
        builder: (BuildContext context, int newIndex, Widget? _) {
          return NavigationBar(
            //animationDuration: const Duration(seconds: 2),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            backgroundColor: backgroundColor,
            selectedIndex: newIndex,
            onDestinationSelected: (int tappedIndex) {
              currentSelectedIndexNotifier.value = tappedIndex;
            },
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: newIndex == 1
                      ? textWhiteShadeDark
                      : secondaryBlueShadeDark,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.settings,
                  color: newIndex == 0
                      ? textWhiteShadeDark
                      : secondaryBlueShadeDark,
                ),
                label: 'Settings',
              ),
            ],
          );
        });
  }
}
