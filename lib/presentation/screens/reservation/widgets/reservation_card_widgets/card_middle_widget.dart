import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/reservation/widgets/reservation_chip.dart';
import 'package:flutter/material.dart';

class CardMiddleNormalRow extends StatelessWidget {
  const CardMiddleNormalRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Date"),
            //replace with somthing more dynamic
            const SizedBox(height: 10),
            Text(
              "Tue, 22 september",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: pureWhite.withOpacity(.85),
              ),
            ),
          ],
        ),
        const ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.start,
          chipTitle: "Time",
          chipText: "10:00",
          chipWidth: 90,
          chipBgColor: primaryDarkShadeLight,
          chipStrokeColor: strokeLight,
          chipTimePeriod: "AM",
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Slots"),
            const SizedBox(height: 10),
            Text(
              "300",
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: pureWhite.withOpacity(.85),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CardMiddleWrappedRow extends StatelessWidget {
  const CardMiddleWrappedRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 10,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.end,
      alignment: WrapAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Date"),
            //replace with somthing more dynamic
            SizedBox(height: 10),
            Text(
              "Tue, 22 september",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Slots"),
            SizedBox(height: 10),
            Text(
              "300",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: extraYellow,
              ),
            ),
          ],
        ),
        const ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.center,
          chipTitle: "Time",
          chipText: "10:00",
          chipWidth: 110,
          chipBgColor: primaryDarkShadeLight,
          chipStrokeColor: strokeLight,
          chipTimePeriod: "AM",
        ),
      ],
    );
  }
}
