import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

class ReservationChip extends StatelessWidget {
  final CrossAxisAlignment chipCrossAxisAlignment;
  final String chipTitle;
  final String chipText;
  final double chipWidth;
  final Color chipTextColor;
  final Color chipBgColor;
  final Color chipStrokeColor;
  final String chipTimePeriod;

  const ReservationChip({
    Key? key,
    required this.chipCrossAxisAlignment,
    required this.chipTitle,
    required this.chipText,
    required this.chipWidth,
    required this.chipBgColor,
    this.chipTimePeriod = "",
    required this.chipStrokeColor,
    this.chipTextColor = textWhiteShadeLight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: chipCrossAxisAlignment,
      children: [
        Text(chipTitle),
        SizedBox(height: chipTitle == "" ? 0 : 5),
        SizedBox(
          width: chipWidth,
          height: chipTitle == "" ? 50 : 40,
          child: Card(
            color: chipBgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                width: 2,
                color: chipStrokeColor,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: chipText,
                        style: TextStyle(
                          fontSize: chipTitle == "" ? 14 : 12,
                          fontWeight: FontWeight.bold,
                          color: chipTextColor,
                        ),
                      ),
                      TextSpan(
                        text: " $chipTimePeriod",
                        style: TextStyle(
                          fontSize: chipTitle == "" ? 14 : 12,
                          fontWeight: FontWeight.bold,
                          color: secondaryBlueShadeLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
