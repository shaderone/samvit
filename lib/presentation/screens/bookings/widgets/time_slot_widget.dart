import 'package:brechfete/bloc/bloc/booking_bloc.dart';
import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:brechfete/presentation/screens/reservations/widgets/reservation_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  int? selectedIndex;
  final timeSlotScrollController = ItemScrollController();

  Future scrollToTimeSlot() async {
    timeSlotScrollController.scrollTo(
      index: selectedIndex!,
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
                        selectedIndex == index
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
                          onTap: () {
                            BookingScreen.isTimeSelectedNotifier.value = true;
                            setState(() {
                              selectedIndex = index;
                            });
                            //get time from api response and send request to get slot info
                          },
                          child: ReservationChip(
                            chipCrossAxisAlignment: CrossAxisAlignment.center,
                            chipTitle: "",
                            chipText: timeText.split(" ").first,
                            chipWidth: 120,
                            chipBgColor: selectedIndex == index
                                ? primaryDarkShadeLight
                                : bgDark,
                            chipStrokeColor: selectedIndex == index
                                ? pureWhite
                                : strokeLight,
                            chipTextColor: selectedIndex == index
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
