import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SlotCalender extends StatefulWidget {
  const SlotCalender({Key? key}) : super(key: key);

  @override
  State<SlotCalender> createState() => _SlotCalenderState();
}

class _SlotCalenderState extends State<SlotCalender> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.utc(2022, 9, 20);
  DateTime? _selectedDay;
  //set holiday and booked days styles (unavailable days)
  //set today style
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: const Color(0xFF1f1f1f),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin:
              const EdgeInsets.only(top: 15, left: 12, right: 12, bottom: 5),
          elevation: 5.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide(color: Color(0xFF1f1f1f), width: 3),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              right: 10,
              left: 10,
            ),
            child: TableCalendar(
              daysOfWeekHeight: 25,
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2022, 9, 19),
              lastDay: DateTime.utc(2022, 9, 25),
              startingDayOfWeek: StartingDayOfWeek.monday,
              currentDay: DateTime.utc(2022, 9, 1),
              rowHeight: 48,
              calendarStyle: CalendarStyle(
                cellMargin: EdgeInsets.all(screenWidth <= 320 ? 4 : 8),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color(0xFF0F9EFF),
                  borderRadius: BorderRadius.circular(5),
                ),
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                outsideDaysVisible: true,
                outsideTextStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                rowDecoration: const BoxDecoration(
                  color: Color(0xFF1f1f1f),
                ),
                defaultDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color(0xFF616161),
                  ),
                ),
                weekendDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color(0xFF616161),
                  ),
                ),
                defaultTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                weekendTextStyle: const TextStyle(color: Colors.white),
                disabledTextStyle: const TextStyle(color: Colors.white38),
              ),
              headerStyle: HeaderStyle(
                titleCentered: true,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                formatButtonVisible: false,
                decoration: BoxDecoration(
                  color: const Color(0xFF1f1f1f),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                ),
                leftChevronIcon: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                  ),
                ),
                rightChevronIcon: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                  ),
                ),
                leftChevronPadding: const EdgeInsets.all(5),
                rightChevronPadding: const EdgeInsets.all(5),
                leftChevronVisible: false, //as per requirement
                rightChevronVisible: false, //as per requirement
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                decoration: BoxDecoration(
                  color: Color(0xFF1f1f1f),
                ),
                weekdayStyle: TextStyle(
                  color: Color(0xFFB3B3B3),
                ),
                weekendStyle: TextStyle(
                  color: Color(0xFFB3B3B3),
                ),
              ),

              /*-------------------events-------------------*/

              enabledDayPredicate: (day) => true,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                var snackBar = SnackBar(
                  content: Text(
                    selectedDay.toString().split(" ").first,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                setState(
                  () {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  },
                );
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}