import 'package:brechfete/core/constants.dart';
import 'package:brechfete/domain/screens/bookings/booking_modal.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/calendar_widget.dart';
import 'package:brechfete/presentation/screens/reservations/widgets/reservation_chip.dart';
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
          mainAxisSize: MainAxisSize.min,
          children: const [
            CalendarStatus(),
            SlotCalender(),
            TimeSlotList(),
            SlotInfoContainer(),
            SlotButtons(),
          ],
        ),
      ),
    );
  }
}

class SlotButtons extends StatelessWidget {
  const SlotButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                primaryDarkShadeLight,
              ),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text("Pay Later"),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text("Pay Now"),
            ),
          ),
        ],
      ),
    );
  }
}

class SlotInfoContainer extends StatelessWidget {
  const SlotInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 125,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: primaryDark,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Flexible(
                  child: SlotStatusItem(
                slotStatus: 'Available',
                slotCount: "120",
                slotCountColor: secondaryBlueShadeLight,
              )),
              Flexible(
                  child: SlotStatusItem(
                slotStatus: "Booked",
                slotCount: "60",
                slotCountColor: extraRed,
              )),
              Flexible(
                child: SlotInputItem(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlotInputItem extends StatelessWidget {
  const SlotInputItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: textWhiteShadeLight,
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: textWhiteShadeLight,
              width: 3,
            ),
          ),
          labelText: "slots",
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelStyle: const TextStyle(
            backgroundColor: pureBlack,
            color: pureWhite,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          filled: true,
          fillColor: pureBlack,
        ),
      ),
    );
  }
}

class SlotStatusItem extends StatelessWidget {
  final String slotStatus;
  final String slotCount;
  final Color slotCountColor;
  const SlotStatusItem({
    Key? key,
    required this.slotStatus,
    required this.slotCount,
    required this.slotCountColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 80,
          width: 100,
          decoration: const BoxDecoration(
            color: Color(0xFF1f1f1f),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                color: Color(0xFF111111),
                offset: Offset(5, 5),
              ),
              BoxShadow(
                blurRadius: 8,
                color: Color(0xFF2d2d2d),
                offset: Offset(-5, -5),
              ),
            ],
            gradient: LinearGradient(
              stops: [0, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff212121),
                Color(0xff1c1c1c),
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(slotStatus),
              const SizedBox(height: 5),
              Text(
                slotCount,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: slotCountColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TimeSlotList extends StatelessWidget {
  const TimeSlotList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30),
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
