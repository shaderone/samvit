import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

class CalendarStatus extends StatelessWidget {
  const CalendarStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        CalendarStatusItem(
          title: "Available",
          bgColor: primaryDarkShadeLight,
          borderColor: textWhiteShadeLight,
        ),
        CalendarStatusItem(
          title: "Booked",
          bgColor: extraRed,
          borderColor: pureWhite,
        ),
        CalendarStatusItem(
          title: "Selected",
          bgColor: secondaryBlueShadeLight,
          borderColor: pureWhite,
        ),
        //CalendarStatusItem(
        //  title: "Unavailable",
        //  bgColor: pureWhite,
        //  borderColor: pureWhite,
        //),
      ],
    );
  }
}

class CalendarStatusItem extends StatelessWidget {
  final String title;

  final Color bgColor, borderColor;
  const CalendarStatusItem({
    Key? key,
    required this.title,
    required this.bgColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(width: 5),
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              width: 2,
              color: borderColor,
            ),
          ),
        ),
      ],
    );
  }
}
