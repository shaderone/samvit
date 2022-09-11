import 'dart:developer';

import 'package:samvit/bloc/slot_info/slot_info_bloc.dart';
import 'package:samvit/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SlotInfoContainer extends StatelessWidget {
  final SlotInfoState state;
  final Function()? reOrderTimeSlotList;
  const SlotInfoContainer({
    Key? key,
    this.reOrderTimeSlotList,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (state.isLoading) {
      return const CircularProgressIndicator(strokeWidth: 2);
    } else {
      return AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            childAnimationBuilder: (widget) {
              return SlideAnimation(
                verticalOffset: 50.0,
                duration: const Duration(milliseconds: 500),
                child: FadeInAnimation(child: widget),
              );
            },
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: primaryDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth <= 320 ? 0 : 5),
                  child: AnimationLimiter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: AnimationConfiguration.toStaggeredList(
                        childAnimationBuilder: (widget) {
                          return SlideAnimation(
                            delay: const Duration(milliseconds: 100),
                            duration: const Duration(milliseconds: 500),
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          );
                        },
                        children: [
                          SlotStatusItem(
                            slotStatus: 'Available',
                            slotCount: state.slotInfo.remainingSlot.toString(),
                            slotCountColor: secondaryBlueShadeLight,
                          ),
                          SlotStatusItem(
                            slotStatus: "Booked",
                            slotCount: state.slotInfo.bookedSlot.toString(),
                            slotCountColor: extraRed,
                          ),
                          SlotInputItem(
                            reOrderTimeSlotList: reOrderTimeSlotList,
                            remainingSlots: state.slotInfo.remainingSlot,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

class SlotInputItem extends StatelessWidget {
  static ValueNotifier<bool> isSlotCountValidatedNotifier =
      ValueNotifier(false);
  final int remainingSlots;
  final _slotInputKey = GlobalKey<FormState>();
  final Function()? reOrderTimeSlotList;
  SlotInputItem({
    Key? key,
    this.reOrderTimeSlotList,
    required this.remainingSlots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _slotInputKey,
      onChanged: () => _slotInputKey.currentState!.validate(),
      child: SizedBox(
        width: screenWidth <= 340 ? 90 : 110,
        height: screenWidth <= 340 ? 60 : 75,
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
            errorStyle: const TextStyle(height: 0),
            labelText: "slots",
            labelStyle: const TextStyle(
              fontSize: 20,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            floatingLabelStyle: const TextStyle(
              color: pureWhite,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            filled: true,
            fillColor: pureBlack,
          ),
          onTap: reOrderTimeSlotList,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"[1-9][0-9]*")),
            //FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (slotCount) async {
            if (_slotInputKey.currentState!.validate()) {
              isSlotCountValidatedNotifier.value = true;
              //save the form data here
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.setString("slotCount", slotCount);
            } else {
              isSlotCountValidatedNotifier.value = false;
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "";
            } else if (int.parse(value) > remainingSlots) {
              return "";
            }
            return null;
          },
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
                    fontSize: screenWidth <= 340 ? 8 : 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenWidth <= 320 ? 0 : 5),
                Text(
                  slotCount,
                  style: TextStyle(
                    fontSize: screenWidth <= 340 ? 16 : 18,
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
