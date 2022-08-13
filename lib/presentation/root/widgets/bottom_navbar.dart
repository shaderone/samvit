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
            animationDuration: const Duration(seconds: 1),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            backgroundColor: backgroundColor,
            selectedIndex: newIndex,
            onDestinationSelected: (int tappedIndex) {
              currentSelectedIndexNotifier.value = tappedIndex;
            },
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.calendar_month,
                  color: secondaryBlueShadeDark,
                ),
                icon: Icon(
                  Icons.calendar_month_outlined,
                  color: textWhiteShadeDark,
                ),
                label: 'booking',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.hourglass_full,
                  color: secondaryBlueShadeDark,
                ),
                icon: Icon(
                  //Icons.watch_later_outlined,
                  Icons.hourglass_bottom,
                  color: textWhiteShadeDark,
                ),
                label: 'reservations',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.account_balance_wallet_rounded,
                  color: secondaryBlueShadeDark,
                ),
                icon: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: textWhiteShadeDark,
                ),
                label: 'Payment History',
              ),
            ],
          );
        });
  }
}
