import 'package:flutter/material.dart';
import 'package:brechfete/core/constants.dart';
import 'widgets/reservation_card_widgets/card_bottom_widget.dart';
import 'widgets/reservation_card_widgets/card_middle_widget.dart';

const extraSmallScreenWidth = 320;

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 25,
        backgroundColor: primaryDarkShadeDark,
        title: Row(
          children: [
            Image.asset("assets/logo.png", width: 30),
            const SizedBox(width: 15),
            const Text(
              "BerchFete",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_rounded,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return const ReservationCard();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10);
        },
        itemCount: 8,
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
      color: primaryDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 10,
      child: Padding(
        padding: screenWidth <= extraSmallScreenWidth
            ? const EdgeInsets.symmetric(vertical: 20, horizontal: 10)
            : const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: [
                const CardTop(),
                screenWidth <= extraSmallScreenWidth
                    ? const SizedBox(height: 10)
                    : const SizedBox(height: 25),
                const CardMiddle(),
                screenWidth <= extraSmallScreenWidth
                    ? const SizedBox(height: 10)
                    : const SizedBox(height: 25),
                const CardBottom(),
              ],
            )
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "St.Joseph HSS",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("Near market roard, changanacherry"),
          ],
        ),
        Card(
          color: Colors.transparent,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          shadowColor: Colors.black,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: primaryDark,
            child: IconButton(
              icon: const Icon(
                Icons.delete_forever,
                //change color later
                color: Colors.red,
              ),
              onPressed: () {},
            ),
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

class CardBottom extends StatelessWidget {
  const CardBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth <= extraSmallScreenWidth
        ? const CardBottomWrappedRow()
        : const CardBottomNormalRow();
  }
}
