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
            /* --ONGOING--

            String date = DateTime.now()
                .toString()
                .split(" ")
                .last
                .split(".")
                .first
                .split(":")
                .first;
            //date = "${date.split(":")[0]}:${date.split(":")[1]}";
            date = "$date:00";
            print(convertTo12HourFormat(date));
            */
            return SizedBox(
              height: 85,
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: const [
                  Positioned(
                    bottom: -20,
                    left: 20,
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 80,
                      color: strokeLight,
                    ),
                  ),
                  ReservationChip(
                    chipCrossAxisAlignment: CrossAxisAlignment.center,
                    chipTitle: "",
                    chipText: "10:00",
                    chipWidth: 120,
                    chipBgColor: primaryDark,
                    chipStrokeColor: strokeLight,
                    chipTimePeriod: "AM",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String convertTo12HourFormat(String time) {
    var timeData = int.parse(time.split(':')[0]);
    String? timePeriod;
    if (timeData >= 12 && timeData < 24) {
      timePeriod = " PM";
    } else {
      timePeriod = " AM";
    }
    if (timeData > 12) {
      timeData = timeData - 12;
      if (timeData < 10) {
        time = time.replaceRange(0, 2, "0$timeData");
        time += timePeriod;
      } else {
        time = time.replaceRange(0, 2, "$timeData");
        time += timePeriod;
      }
    } else if (timeData == 00) {
      time = time.replaceRange(0, 2, '12');
      time += timePeriod;
    } else {
      time += timePeriod;
    }
    return time;
  }
}
