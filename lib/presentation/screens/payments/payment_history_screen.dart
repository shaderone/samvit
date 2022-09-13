import 'dart:developer';

import 'package:brechfete/bloc/payment/payment_bloc.dart';
import 'package:brechfete/core/constants.dart';
import 'package:brechfete/domain/screens/payment/payment_history/payment_history.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:brechfete/presentation/screens/reservations/widgets/reservation_chip.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
        context.read<PaymentBloc>().add(const PaymentEvent.getPaymentList()));
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
          body: BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              List<PaymentHistoryModal> onlineList = state.paymentList
                  .where((item) => item.paymentType == "Online")
                  .toList();
              List<PaymentHistoryModal> payLaterList = state.paymentList
                  .where((item) => item.paymentType == "Pay Later")
                  .toList();
              List<PaymentHistoryModal> readyCashList = state.paymentList
                  .where((item) => item.paymentType == "Ready Cash")
                  .toList();

              if (state.isLoading) {
                EasyLoading.instance.indicatorType =
                    EasyLoadingIndicatorType.wave;
                EasyLoading.show(status: 'Loading...');
                return const SizedBox();
              } else if (state.isError) {
                EasyLoading.dismiss();
                return const Center(
                  child: Text("Unable to fetch data, please try again!"),
                );
              } else if (state.paymentList.isEmpty) {
                EasyLoading.dismiss();
                return const TabBarView(children: [
                  Center(child: Text("History is Empty!")),
                  Center(child: Text("History is Empty!")),
                  Center(child: Text("History is Empty!")),
                ]);
              } else {
                EasyLoading.dismiss();
                return TabBarView(
                  dragStartBehavior: DragStartBehavior.down,
                  children: List.generate(
                    3,
                    (index) {
                      List<PaymentHistoryModal> respectiveList;
                      if (index == 0) {
                        respectiveList = readyCashList;
                      } else if (index == 1) {
                        respectiveList = onlineList;
                      } else if (index == 2) {
                        respectiveList = payLaterList;
                      } else {
                        respectiveList = [];
                      }
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
                                          index == 0 ? "Amount Paid" : "Status",
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
                            if (respectiveList.isEmpty)
                              const Expanded(
                                child: Center(
                                  child: Text("No Payments to show!"),
                                ),
                              )
                            else
                              Expanded(
                                child: RefreshIndicator(
                                  displacement: 0,
                                  color: secondaryBlueShadeLight,
                                  strokeWidth: 2,
                                  triggerMode:
                                      RefreshIndicatorTriggerMode.onEdge,
                                  onRefresh: () async => context
                                      .read<PaymentBloc>()
                                      .add(const PaymentEvent.getPaymentList()),
                                  child: ListView.separated(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(respectiveList[index]
                                                .collegeName),
                                            respectiveList[index]
                                                        .paymentStatus ==
                                                    "Paid"
                                                ? respectiveList[index]
                                                            .paymentType ==
                                                        "Ready Cash"
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 10,
                                                        ),
                                                        child: Text(
                                                          respectiveList[index]
                                                              .amount
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      )
                                                    : const PaymentChip(
                                                        paymentStatus: "Paid",
                                                        color: extraGreen,
                                                      )
                                                : respectiveList[index]
                                                            .paymentStatus ==
                                                        "Pending"
                                                    ? const PaymentChip(
                                                        paymentStatus:
                                                            "Pending",
                                                        color: extraYellow)
                                                    : const PaymentChip(
                                                        paymentStatus:
                                                            "Processing",
                                                        color:
                                                            secondaryBlueShadeDark,
                                                      )
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const Divider(),
                                    itemCount: respectiveList.length,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class PaymentChip extends StatelessWidget {
  final String paymentStatus;
  final Color color;
  const PaymentChip({
    Key? key,
    required this.paymentStatus,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReservationChip(
      chipCrossAxisAlignment: CrossAxisAlignment.center,
      chipTitle: "",
      chipText: paymentStatus,
      chipWidth: 120,
      chipBgColor: color.withOpacity(.1),
      chipStrokeColor: color,
      isPaymentChip: true,
    );
  }
}
