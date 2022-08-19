import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

class SlotInfoContainer extends StatelessWidget {
  const SlotInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: primaryDark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: const [
          SlotStatusItem(
            slotStatus: 'Available',
            slotCount: "120",
            slotCountColor: secondaryBlueShadeLight,
          ),
          SlotStatusItem(
            slotStatus: "Booked",
            slotCount: "60",
            slotCountColor: extraRed,
          ),
          SlotInputItem(),
        ],
      ),
    );
  }
}

class SlotInputItem extends StatelessWidget {
  const SlotInputItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth <= 340 ? 90 : 120,
      height: screenWidth <= 340 ? 60 : 70,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: textWhiteShadeLight,
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: textWhiteShadeLight,
              width: 3,
            ),
          ),
          labelText: "slots",
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelStyle: const TextStyle(
            backgroundColor: pureBlack,
            color: pureWhite,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          filled: true,
          fillColor: pureBlack,
        ),
      ),
    );
  }
}

class SlotStatusItem extends StatelessWidget {
  final String slotStatus;
  final String slotCount;
  final Color slotCountColor;
  const SlotStatusItem({
    Key? key,
    required this.slotStatus,
    required this.slotCount,
    required this.slotCountColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: screenWidth <= 340 ? 60 : 70,
          width: screenWidth <= 340 ? 80 : 90,
          decoration: const BoxDecoration(
            color: Color(0xFF1f1f1f),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color.fromRGBO(20, 20, 20, 1),
                offset: Offset(5, 5),
              ),
              BoxShadow(
                blurRadius: 5,
                color: Color.fromARGB(255, 43, 43, 43),
                offset: Offset(-5, -5),
              ),
            ],
            gradient: LinearGradient(
              stops: [0, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff212121),
                Color(0xff1c1c1c),
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  slotStatus,
                  style: TextStyle(
                    fontSize: screenWidth <= 340 ? 10 : 12,
                  ),
                ),
                SizedBox(height: screenWidth <= 320 ? 0 : 5),
                Text(
                  slotCount,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: slotCountColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
