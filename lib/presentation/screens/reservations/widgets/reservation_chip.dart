import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

class ReservationChip extends StatelessWidget {
  final CrossAxisAlignment chipCrossAxisAlignment;
  final String chipTitle;
  final String chipText;
  final double chipWidth;
  final Color? chipTitleColor;
  final Color chipTextColor;
  final Color chipBgColor;
  final Color chipStrokeColor;
  final String chipTimePeriod;
  final bool isPaymentChip;

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
    this.isPaymentChip = false,
    this.chipTitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: chipCrossAxisAlignment,
      children: [
        isPaymentChip
            ? const SizedBox()
            : chipTitleColor != null
                ? Text(
                    chipTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: textWhiteShadeDark,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                : Text(
                    chipTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: textWhiteShadeDark,
                    ),
                  ),
        isPaymentChip
            ? const SizedBox(
                height: 7,
              )
            : SizedBox(height: chipTitle == "" ? 0 : 3),
        SizedBox(
          width: chipWidth,
          height: isPaymentChip ? 40 : 45,
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
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: chipTextColor,
                        ),
                      ),
                      TextSpan(
                        text: " $chipTimePeriod",
                        style: const TextStyle(
                          fontSize: 14,
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
