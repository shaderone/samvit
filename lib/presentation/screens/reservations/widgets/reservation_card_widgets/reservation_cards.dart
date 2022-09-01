import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/reservations/widgets/reservation_chip.dart';
import 'package:flutter/material.dart';

class CardTop extends StatelessWidget {
  const CardTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "St.Joseph HSS",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: pureWhite.withOpacity(.85),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "Near market roard, changanacherry",
          style: TextStyle(
            fontSize: screenWidth <= 320 ? 12 : 14,
          ),
        ),
      ],
    );
  }
}

class CardMiddle extends StatelessWidget {
  const CardMiddle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
        ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.start,
          chipTitle: "Time",
          chipText: "10:00",
          chipWidth: screenWidth < 320 ? 90 : 110,
          chipBgColor: primaryDarkShadeLight,
          chipStrokeColor: strokeLight,
          chipTimePeriod: "AM",
          chipTextColor: pureWhite,
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

class CardBottom extends StatelessWidget {
  const CardBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 2),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    //reshedule
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Cancel & Reshedule"),
                      SizedBox(width: 10),
                      Icon(Icons.event_repeat),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
