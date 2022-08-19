import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/reservations/widgets/reservation_chip.dart';
import 'package:flutter/material.dart';

class TimeSlotList extends StatelessWidget {
  const TimeSlotList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      primary: false,
      child: Row(
        children: List.generate(
          12,
          (index) {
            return const ReservationChip(
              chipCrossAxisAlignment: CrossAxisAlignment.center,
              chipTitle: "",
              chipText: "10:00",
              chipWidth: 120,
              chipBgColor: primaryDark,
              chipStrokeColor: strokeLight,
              chipTimePeriod: "AM",
            );
          },
        ),
      ),
    );
  }
}
