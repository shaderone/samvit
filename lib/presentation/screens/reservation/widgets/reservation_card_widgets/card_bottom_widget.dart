import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/reservation/widgets/reservation_chip.dart';
import 'package:flutter/material.dart';

class CardBottomNormalRow extends StatelessWidget {
  const CardBottomNormalRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.center,
          chipTitle: "Exhibition Status",
          chipText: "ONGOING",
          chipWidth: 110,
          chipBgColor: secondaryBlueShadeLight.withOpacity(0.1),
          chipStrokeColor: secondaryBlueShadeLight,
        ),
        ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.center,
          chipTitle: "Payment Status",
          chipText: "PAID",
          chipWidth: 110,
          chipBgColor: extraGreen.withOpacity(0.1),
          chipStrokeColor: extraGreen,
        ),
        SizedBox(
          height: 50,
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
                Icon(Icons.event_repeat),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CardBottomWrappedRow extends StatelessWidget {
  const CardBottomWrappedRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.center,
          chipTitle: "Exhibition Status",
          chipText: "ONGOING",
          chipWidth: 110,
          chipBgColor: secondaryBlueShadeLight.withOpacity(0.1),
          chipStrokeColor: secondaryBlueShadeLight,
        ),
        ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.center,
          chipTitle: "Payment Status",
          chipText: "PAID",
          chipWidth: 110,
          chipBgColor: extraGreen.withOpacity(0.1),
          chipStrokeColor: extraGreen,
        ),

        //platform specific button here
        SizedBox(
          height: 50,
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
                Text("Reshedule"),
                SizedBox(width: 10),
                Icon(Icons.event_repeat),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
