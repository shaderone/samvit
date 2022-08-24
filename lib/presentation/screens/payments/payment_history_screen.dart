import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tabbed_sliverlist/tabbed_sliverlist.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: TabbedList(
        tabLength: 3,
        sliverTabBar: SliverTabBar(
          title: Row(
            children: [
              Image.asset("assets/images/logo.png", width: 30),
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
          actions: [
            IconButton(
              onPressed: () => logout(mounted, context),
              icon: const Icon(
                Icons.logout_rounded,
              ),
            ),
          ],
          tabBar: TabBar(
            indicatorColor: secondaryBlueShadeLight,
            tabs: [
              const Tab(
                text: 'Online',
              ),
              Tab(
                child: Text(
                  "Ready Cash",
                  style: TextStyle(fontSize: screenWidth <= 320 ? 12 : 16),
                ),
              ),
              const Tab(
                text: 'Pay later',
              )
            ],
          ),
        ),
        tabLists: [
          TabListBuilder(
            uniquePageKey: 'page1',
            length: 15,
            builder: (BuildContext context, index) {
              return const Padding(
                padding: EdgeInsets.only(top: 10),
                child: ListTile(
                  leading: Text("payment data"),
                  trailing: Icon(Icons.money),
                ),
              );
            },
          ),
          TabListBuilder(
            uniquePageKey: 'page2',
            length: 5,
            builder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(top: 10),
                child: ListTile(
                  leading: Text("payment data"),
                  trailing: Icon(Icons.money),
                ),
              );
            },
          ),
          TabListBuilder(
            uniquePageKey: 'page3',
            length: 3,
            builder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(top: 10),
                child: ListTile(
                  leading: Text("payment data"),
                  trailing: Icon(Icons.money),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
