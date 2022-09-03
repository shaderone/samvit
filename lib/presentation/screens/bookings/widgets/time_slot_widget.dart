import 'package:brechfete/bloc/bloc/booking_bloc.dart';
import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:brechfete/presentation/screens/reservations/widgets/reservation_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TimeSlotList extends StatefulWidget {
  final double maxHeight;
  const TimeSlotList({
    Key? key,
    required this.maxHeight,
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
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        return AnimationLimiter(
          child: ScrollablePositionedList.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemScrollController: timeSlotScrollController,
            itemBuilder: (context, index) {
              final timeText = state.timeSlotList[index].time;
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
            itemCount: state.timeSlotList.length,
          ),
        );
      },
    );
  }
}
