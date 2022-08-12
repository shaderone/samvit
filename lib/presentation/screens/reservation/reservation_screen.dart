import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BerchFete"),
      ),
      body: Padding(
        //platform specific padding here
        padding: const EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 10),
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
      //height shows no issue
      height: 225,
      child: Card(
        color: primaryDarkShadeDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                children: [
                  //first row start
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "St.Joseph HSS",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text("Near market roard, changanacherry"),
                        ],
                      ),
                      Card(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        shadowColor: Colors.black87,
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
                  ),
                  //first row end
                  const SizedBox(height: 15),
                  //second row start
                  Row(
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
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Time"),
                          //disabled button
                          Card(
                            color: primaryDarkShadeLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                width: 2,
                                color: strokeLight,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 7,
                                horizontal: 10,
                              ),
                              child: Text(
                                "10:00 AM",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Slots"),
                          Text(
                            "300",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Second row end
                  const SizedBox(height: 15),
                  //Thrid row start
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Exhibition Status"),
                          Card(
                            color: primaryDarkShadeLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                width: 2,
                                color: strokeLight,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 7,
                                horizontal: 10,
                              ),
                              child: Text(
                                "ONGOING",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Payment Status"),
                          //disabled button
                          Card(
                            color: primaryDarkShadeLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                width: 2,
                                color: strokeLight,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 7,
                                horizontal: 10,
                              ),
                              child: Text(
                                "PAID",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //platform specific button here
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
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
                  ),
                  //Third row end
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
