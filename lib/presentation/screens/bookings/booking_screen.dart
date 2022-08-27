import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/root/widgets/bottom_navbar.dart';
import 'package:brechfete/presentation/screens/bookings/pages/expo_registration_page.dart';
import 'package:brechfete/presentation/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/slot_status_widgets/slot_info_container.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/time_slot_widget.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/calendar_widget.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/calendar_widgets/calendar_status_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class BookingScreen extends StatefulWidget {
  static final ValueNotifier<bool> isDateSelectedNotifier =
      ValueNotifier(false);
  static final ValueNotifier<bool> isTimeSelectedNotifier =
      ValueNotifier(false);
  const BookingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final GlobalKey<TimeSlotListState> _timeSlotListStateKey =
      GlobalKey<TimeSlotListState>();
  initiateTimeSlotScroll() {
    if (_timeSlotListStateKey.currentState == null) {
      print("object");
      return;
    } else {
      _timeSlotListStateKey.currentState!.scrollToTimeSlot();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        final isKeyboardActive = MediaQuery.of(context).viewInsets.bottom != 0;
        if (isKeyboardActive) {
          return;
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 5,
          title: Row(
            children: [
              Image.asset("assets/images/logo.png", width: 30),
              const SizedBox(width: 15),
              GradientText(
                'Slot Booking',
                style: GoogleFonts.ubuntu(
                  fontSize: screenWidth <= 320 ? 20 : 24,
                ),
                colors: const [
                  Color(0xFF6E6F71),
                  Color(0xFFECECEC),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () => logout(mounted, context),
              icon: const Icon(
                Icons.logout_rounded,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              vertical: 20, horizontal: screenWidth <= 340 ? 10 : 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const CalendarStatus(),
              const SizedBox(height: 10),
              const SlotCalender(),
              SizedBox(
                height: 90,
                child: ValueListenableBuilder(
                  valueListenable: BookingScreen.isDateSelectedNotifier,
                  builder:
                      (BuildContext context, bool isDateSelected, Widget? _) {
                    return Visibility(
                      visible: isDateSelected,
                      child: TimeSlotList(
                        maxHeight: 90,
                        key: _timeSlotListStateKey,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              ValueListenableBuilder(
                valueListenable: BookingScreen.isTimeSelectedNotifier,
                builder:
                    (BuildContext context, bool isTimeSelected, Widget? _) {
                  return Visibility(
                    visible: isTimeSelected,
                    child: SlotInfoContainer(
                      reOrderTimeSlotList: () {
                        //function to re-order time-slotlist
                        initiateTimeSlotScroll();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              ValueListenableBuilder(
                valueListenable: BookingScreen.isTimeSelectedNotifier,
                builder:
                    (BuildContext context, bool isTimeSelected, Widget? _) {
                  return Visibility(
                    visible: isTimeSelected,
                    child: const ConfirmButton(),
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //save the form data here

        //After saving, go to next page
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => const ExpoRegistration(),
          ),
        );
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size.fromHeight(50),
        ),
      ),
      child: const Text("Confirm Slots"),
    );
  }
}

void logout(bool mounted, BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("token");
  MaterialBottomNav.currentSelectedIndexNotifier.value = 0;
  BookingScreen.isDateSelectedNotifier.value = false;
  BookingScreen.isTimeSelectedNotifier.value = false;
  if (!mounted) return;
  Navigator.of(context).pushReplacementNamed(App.loginRoute);
}
