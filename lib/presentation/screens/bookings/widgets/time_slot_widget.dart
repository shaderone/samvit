import 'package:fluttertoast/fluttertoast.dart';
import 'package:samvit/bloc/booking/booking_bloc.dart';
import 'package:samvit/bloc/slot_info/slot_info_bloc.dart';
import 'package:samvit/core/constants.dart';
import 'package:samvit/presentation/screens/bookings/booking_screen.dart';
import 'package:samvit/presentation/screens/reservations/widgets/reservation_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeSlotList extends StatefulWidget {
  final BookingState state;
  final double maxHeight;
  const TimeSlotList({
    Key? key,
    required this.maxHeight,
    required this.state,
  }) : super(key: key);

  @override
  State<TimeSlotList> createState() => TimeSlotListState();
}

class TimeSlotListState extends State<TimeSlotList> {
  int selectedIndex = -1;
  final timeSlotScrollController = ItemScrollController();

  Future scrollToTimeSlot() async {
    timeSlotScrollController.scrollTo(
      index: selectedIndex,
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: secondaryBlueShadeDark,
        ),
      );
    } else if (widget.state.isError) {
      Fluttertoast.showToast(
        msg: "Please check your internet connection",
        textColor: extraRed,
      );
      return StatusWidget(
        statusBgColor: extraRed.withOpacity(.05),
        statusColor: extraRed,
        statusText: "Unable to fetch time",
      );
    } else if (widget.state.timeSlotList.isEmpty) {
      return StatusWidget(
        statusBgColor: extraYellow.withOpacity(.05),
        statusColor: extraYellow,
        statusText: "No time slots available",
      );
    } else {
      return AnimationLimiter(
        child: ScrollablePositionedList.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemScrollController: timeSlotScrollController,
          itemBuilder: (context, index) {
            final timeText = widget.state.timeSlotList[index].time;
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: SizedBox(
                    height: widget.maxHeight,
                    child: Stack(
                      children: [
                        selectedIndex == index &&
                                BookingScreen.isTimeSelectedNotifier.value
                            ? const Positioned(
                                bottom: -20,
                                left: 20,
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 80,
                                  color: pureWhite,
                                ),
                              )
                            : const SizedBox(),
                        GestureDetector(
                          onTap: () async {
                            BookingScreen.isTimeSelectedNotifier.value = true;
                            setState(() {
                              selectedIndex = index;
                            });
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            final selectedDate =
                                await prefs.getString("selectedDate");
                            //get time from api response and send request to get slot info
                            if (!mounted) return;
                            final selectedTimeText =
                                widget.state.timeSlotList[selectedIndex].time;
                            context.read<SlotInfoBloc>().add(
                                  SlotInfoEvent.getSlotInfo(
                                    date: selectedDate!,
                                    time: selectedTimeText,
                                  ),
                                );
                          },
                          child: ReservationChip(
                            chipCrossAxisAlignment: CrossAxisAlignment.center,
                            chipTitle: "",
                            chipText: timeText.split(" ").first,
                            chipWidth: 120,
                            chipBgColor: selectedIndex == index &&
                                    BookingScreen.isTimeSelectedNotifier.value
                                ? primaryDarkShadeLight
                                : bgDark,
                            chipStrokeColor: selectedIndex == index &&
                                    BookingScreen.isTimeSelectedNotifier.value
                                ? pureWhite
                                : strokeLight,
                            chipTextColor: selectedIndex == index &&
                                    BookingScreen.isTimeSelectedNotifier.value
                                ? pureWhite
                                : textWhiteShadeDark,
                            chipTimePeriod: timeText.split(" ").last,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: widget.state.timeSlotList.length,
        ),
      );
    }
  }
}

class StatusWidget extends StatelessWidget {
  final String statusText;
  final Color statusColor;
  final Color statusBgColor;
  const StatusWidget({
    Key? key,
    required this.statusText,
    required this.statusColor,
    required this.statusBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: ColoredBox(
              color: statusBgColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  statusText,
                  style: GoogleFonts.nunito(
                    color: statusColor,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
