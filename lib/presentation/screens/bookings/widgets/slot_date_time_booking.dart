import 'package:brechfete/core/constants.dart';
import 'package:brechfete/domain/screens/bookings/booking_modal.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/calendar_widget.dart';
import 'package:flutter/material.dart';

class SlotDateTimeBooking extends StatelessWidget {
  final BookingsModal bookingsModal;
  const SlotDateTimeBooking({
    Key? key,
    required this.bookingsModal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "book slots",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CalendarStatus(),
            SlotCalender(),
          ],
        ),
      ),
    );
  }
}

class CalendarStatus extends StatelessWidget {
  const CalendarStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 5),
      child: Row(
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
      ),
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
