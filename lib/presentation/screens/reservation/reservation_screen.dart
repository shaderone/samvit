import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/reservation/widgets/reservation_chip.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        //platform specific padding here
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
          top: 20,
          bottom: 10,
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return const ReservationCard();
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
    return SizedBox(
      height: 250,
      child: Card(
        color: primaryDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                children: const [
                  CardTop(),
                  SizedBox(height: 25),
                  CardMiddle(),
                  SizedBox(height: 25),
                  CardBottom(),
                ],
              )
            ],
          ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Date"),
            //replace with somthing more dynamic
            SizedBox(height: 10),
            Text(
              "Tue, 22 september",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        const ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.start,
          chipTitle: "Time",
          chipText: "10:00 AM",
          chipWidth: 110,
          chipBgColor: primaryDarkShadeLight,
          chipStrokeColor: strokeLight,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Slots"),
            SizedBox(height: 10),
            Text(
              "300",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: extraYellow,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CardBottom extends StatelessWidget {
  const CardBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.center,
          chipTitle: "Exhibition Status",
          chipText: "ONGOING",
          chipWidth: 110,
          chipBgColor: secondaryBlueShadeLight.withOpacity(0.1),
          chipStrokeColor: secondaryBlueShadeLight,
        ),
        ReservationChip(
          chipCrossAxisAlignment: CrossAxisAlignment.center,
          chipTitle: "Payment Status",
          chipText: "PAID",
          chipWidth: 110,
          chipBgColor: extraGreen.withOpacity(0.1),
          chipStrokeColor: extraGreen,
        ),

        //platform specific button here
        SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 10),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            onPressed: () {
              //reshedule
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Reshedule"),
                SizedBox(width: 10),
                Icon(Icons.event_repeat),
              ],
            ),
            //child: Row(
            //  mainAxisAlignment: MainAxisAlignment.center,
            //  children: const [
            //    Icon(Icons.event_repeat),
            //  ],
            //),
          ),
        ),
      ],
    );
  }
}
