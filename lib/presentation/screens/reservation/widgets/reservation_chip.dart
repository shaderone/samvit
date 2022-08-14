import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

class ReservationChip extends StatelessWidget {
  final CrossAxisAlignment chipCrossAxisAlignment;
  final String chipTitle;
  final String chipText;
  final double chipWidth;
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: chipCrossAxisAlignment,
      children: [
        Text(chipTitle),
        const SizedBox(height: 5),
        SizedBox(
          width: chipWidth,
          child: Card(
            color: chipBgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                width: 2,
                color: chipStrokeColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: chipText,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " $chipTimePeriod",
                      style: const TextStyle(
                        fontSize: 12,
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
      ],
    );
  }
}
