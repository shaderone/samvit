import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:brechfete/presentation/screens/reservations/widgets/reservation_chip.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset("assets/images/samvit_logo.png",
                          width: 30),
                    ),
                    const SizedBox(width: 15),
                    GradientText(
                      'Payment History',
                      style: GoogleFonts.ubuntu(
                        fontSize: screenWidth <= 320 ? 20 : 24,
                      ),
                      colors: const [
                        Color(0xFF6E6F71),
                        Color(0xFFECECEC),
                      ],
                    ),
                  ],
                ),
                pinned: true,
                floating: true,
                actions: [
                  IconButton(
                    onPressed: () => logout(mounted, context),
                    icon: const Icon(
                      Icons.logout_rounded,
                    ),
                  ),
                ],
                bottom: TabBar(
                  indicatorColor: secondaryBlueShadeLight,
                  isScrollable: screenWidth < 340 ? true : false,
                  tabs: const [
                    Tab(child: Text('Ready Cash')),
                    Tab(child: Text('Online')),
                    Tab(child: Text('pay Later')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            dragStartBehavior: DragStartBehavior.down,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              3,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ColoredBox(
                            color: primaryDark,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name",
                                    style: GoogleFonts.ubuntu(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    "Status",
                                    style: GoogleFonts.ubuntu(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("St. Peters"),
                                  ReservationChip(
                                    chipCrossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    chipTitle: "",
                                    chipText: "Processing",
                                    chipWidth: 120,
                                    chipBgColor:
                                        secondaryBlueShadeDark.withOpacity(.1),
                                    chipStrokeColor: secondaryBlueShadeDark,
                                    isPaymentChip: true,
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemCount: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
