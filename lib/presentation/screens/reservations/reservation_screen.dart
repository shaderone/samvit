import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:brechfete/core/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'widgets/reservation_card_widgets/card_bottom_widget.dart';
import 'widgets/reservation_card_widgets/card_middle_widget.dart';

const extraSmallScreenWidth = 320;

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryDarkShadeLight,
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 5,
        //backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset("assets/images/logo.png", width: 30),
            const SizedBox(width: 15),
            const Text(
              "Reservations",
              style: TextStyle(fontSize: 24),
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
      body: AnimationLimiter(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: const SlideAnimation(
                child: FadeInAnimation(
                  child: ReservationCard(),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
          itemCount: 8,
        ),
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  const ReservationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
      color: primaryDarkShadeLight.withOpacity(.35),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 10,
      child: Padding(
        padding: screenWidth <= extraSmallScreenWidth
            ? const EdgeInsets.symmetric(vertical: 20, horizontal: 10)
            : const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CardTop(),
            screenWidth <= extraSmallScreenWidth
                ? const SizedBox(height: 10)
                : const SizedBox(height: 15),
            const CardMiddle(),
            screenWidth <= extraSmallScreenWidth
                ? const SizedBox(height: 10)
                : const SizedBox(height: 15),
            const CardBottom(),
          ],
        ),
      ),
    );
  }
}

class CardTop extends StatelessWidget {
  const CardTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "St.Joseph HSS",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: pureWhite.withOpacity(.85),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "Near market roard, changanacherry",
          style: TextStyle(
            fontSize: screenWidth <= 320 ? 12 : 14,
          ),
        ),
      ],
    );
  }
}

class CardMiddle extends StatelessWidget {
  const CardMiddle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth <= extraSmallScreenWidth
        ? const CardMiddleWrappedRow()
        : const CardMiddleNormalRow();
  }
}
