import 'package:flutter/material.dart';

class ReservationChip extends StatelessWidget {
  final CrossAxisAlignment chipCrossAxisAlignment;
  final String chipTitle;
  final String chipText;
  final double chipWidth;
  final Color chipBgColor;
  //final Color chipTextColor;
  final Color chipStrokeColor;

  const ReservationChip({
    Key? key,
    required this.chipCrossAxisAlignment,
    required this.chipTitle,
    required this.chipText,
    required this.chipWidth,
    required this.chipBgColor,
    //required this.chipTextColor,
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
              child: Text(
                chipText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
