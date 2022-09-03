import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/reservations/widgets/reservation_chip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTop extends StatelessWidget {
  const CardTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "St.Joseph HSS",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Near market roard, changanacherry",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth <= 320 ? 12 : 14,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  secondaryBlueShadeDark,
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 10),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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
        ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.start,
          chipTitle: "Date",
          chipText: "Tue, 22 September",
          chipWidth: screenWidth < 320 ? 90 : 160,
          chipBgColor: primaryDarkShadeLight,
          chipStrokeColor: textWhiteShadeDark,
          chipTimePeriod: "",
          chipTextColor: pureWhite,
          chipTitleColor: secondaryBlueShadeLight.withOpacity(.8),
        ),
        ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.start,
          chipTitle: "Time",
          chipText: "10:00",
          chipWidth: screenWidth < 320 ? 90 : 100,
          chipBgColor: primaryDarkShadeLight,
          chipStrokeColor: textWhiteShadeDark,
          chipTimePeriod: "AM",
          chipTextColor: pureWhite,
          chipTitleColor: secondaryBlueShadeLight.withOpacity(.8),
        ),
        ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.start,
          chipTitle: "Slots",
          chipText: "300",
          chipWidth: screenWidth < 320 ? 90 : 70,
          chipBgColor: primaryDarkShadeLight,
          chipStrokeColor: textWhiteShadeDark,
          chipTimePeriod: "",
          chipTextColor: pureWhite,
          chipTitleColor: secondaryBlueShadeLight.withOpacity(.8),
        ),
      ],
    );
  }
}
