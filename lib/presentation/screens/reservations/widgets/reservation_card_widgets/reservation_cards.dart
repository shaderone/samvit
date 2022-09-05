import 'package:brechfete/bloc/reservation/reservation_bloc.dart';
import 'package:brechfete/core/constants.dart';
import 'package:brechfete/domain/screens/reservation/reservation/reservation.dart';
import 'package:brechfete/presentation/screens/reservations/widgets/reservation_chip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTop extends StatelessWidget {
  final ReservationModal state;

  const CardTop({
    Key? key,
    required this.state,
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
                state.name,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                state.address,
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
  final ReservationModal state;
  const CardMiddle({
    Key? key,
    required this.state,
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
          chipText: state.date,
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
          chipText: state.time.split(" ").first,
          chipWidth: screenWidth < 320 ? 90 : 100,
          chipBgColor: primaryDarkShadeLight,
          chipStrokeColor: textWhiteShadeDark,
          chipTimePeriod: state.time.split(" ").last,
          chipTextColor: pureWhite,
          chipTitleColor: secondaryBlueShadeLight.withOpacity(.8),
        ),
        ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.start,
          chipTitle: "Slots",
          chipText: state.slotCount.toString(),
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
