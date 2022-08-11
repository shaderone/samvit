import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

final ValueNotifier<int> currentSelectedIndexNotifier = ValueNotifier(0);

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: currentSelectedIndexNotifier,
        builder: (BuildContext context, int newSelectedIndex, Widget? _) {
          return SizedBox(
            height: 70,
            child: BottomNavigationBar(
              currentIndex: newSelectedIndex,
              backgroundColor: primaryDark,
              selectedItemColor: Colors.white,
              unselectedItemColor: textWhiteShadeDark,
              iconSize: 30,
              selectedFontSize: 14,
              unselectedFontSize: 14,
              //fixedColor: primaryDark,
              type: BottomNavigationBarType.shifting,
              onTap: (newIndex) {
                currentSelectedIndexNotifier.value = newIndex;
              },
              items: [
                const BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Icon(Icons.more_time),
                  ),
                  label: "booking",
                  backgroundColor: primaryDarkShadeDark,
                ),
                BottomNavigationBarItem(
                  icon: const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Icon(Icons.library_books_outlined),
                  ),
                  label: "reservations",
                  backgroundColor: primaryDark.withOpacity(.4),
                ),
              ],
            ),
          );
        });
  }
}
