import 'dart:convert';
import 'dart:developer';
import 'package:brechfete/bloc/reservation/reservation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:brechfete/core/constants.dart';
import 'package:brechfete/domain/screens/reservation/reservation/reservation.dart';
import 'package:brechfete/presentation/screens/bookings/pages/expo_registration_page.dart';
import 'package:brechfete/presentation/screens/reservations/widgets/reservation_chip.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CardTop extends StatefulWidget {
  final ReservationModal state;

  const CardTop({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<CardTop> createState() => _CardTopState();
}

class _CardTopState extends State<CardTop> {
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
                widget.state.name,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.state.address,
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
                  extraRed,
                  //secondaryBlueShadeDark,
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
              onPressed: () async {
                final shouldPop = await showCustomAlertDialog(
                    context,
                    "Are you sure?",
                    "Delete reservation for '${widget.state.name}'",
                    "No",
                    "Yes",
                    extraRed,
                    primaryDark);

                if (shouldPop != null && shouldPop) {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  final token = prefs.getString("token");
                  var client = http.Client();
                  var response = await client.delete(
                    Uri.parse(
                      "$baseURL/reservation-delete/${widget.state.id}",
                    ),
                    headers: {
                      "Content-Type": "application/json",
                      "Authorization": "Token $token"
                    },
                  );
                  //reshedule
                  print(widget.state.id);
                  if (jsonDecode(response.body)['is_deleted']) {
                    if (!mounted) return;
                    context
                        .read<ReservationBloc>()
                        .add(const ReservationEvent.getReservationList());
                    Fluttertoast.showToast(
                      msg: "Deleted Successfully!",
                      textColor: extraRed,
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "Deletion failed!",
                      textColor: extraRed,
                    );
                  }
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.delete_forever),
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
    final date = DateTime.parse(state.date);
    final DateFormat formatter = DateFormat('E, MMMM d'); //MMMEd
    final String formattedDate = formatter.format(date);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.start,
          chipTitle: "Date",
          chipText: formattedDate,
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
