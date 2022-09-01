import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:brechfete/presentation/screens/bookings/pages/booking_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

enum Pet { dog, cat }

class PayNowPage extends StatefulWidget {
  const PayNowPage({Key? key}) : super(key: key);

  @override
  State<PayNowPage> createState() => _PayNowPageState();
}

class _PayNowPageState extends State<PayNowPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Select Payment Mode",
            style: GoogleFonts.ubuntu(fontSize: screenWidth <= 320 ? 20 : 24),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    //Radio<Pet>(
                    //  fillColor: MaterialStateColor.resolveWith(
                    //    (states) => secondaryBlueShadeLight,
                    //  ),
                    //  focusColor: MaterialStateColor.resolveWith(
                    //      (states) => secondaryBlueShadeDark),
                    //  value: Pet.dog,
                    //  groupValue: _pet,
                    //  onChanged: (Pet? value) {
                    //    setState(() {
                    //      _pet = value!;
                    //    });
                    //  },
                    //),
                    Text(
                      "Online",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    //Radio<Pet>(
                    //  fillColor: MaterialStateColor.resolveWith(
                    //    (states) => secondaryBlueShadeLight,
                    //  ),
                    //  focusColor: MaterialStateColor.resolveWith(
                    //      (states) => secondaryBlueShadeDark),
                    //  value: Pet.cat,
                    //  groupValue: _pet,
                    //  onChanged: (Pet? value) {
                    //    setState(() {
                    //      _pet = value!;
                    //    });
                    //  },
                    //),
                    Text(
                      "Ready Cash",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            indicatorColor: secondaryBlueShadeLight,
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(
                        50,
                      ), // fromHeight use double.infinity as width and 40 is the height
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const BookingSuccessPage(
                            animationWidget: "assets/lottie_files/confirm.json",
                            statusText: "Booking Successful!",
                          ),
                        ),
                      );
                    },
                    child: const Text("Send Payment Link"),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "OR",
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      color: textWhiteShadeDark,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: QrImage(
                      data: 'This QR code has an embedded image as well',
                      version: QrVersions.auto,
                      size: screenWidth <= 320 ? 150 : 250,
                      gapless: false,
                      embeddedImage:
                          const AssetImage('assets/images/sb100.png'),
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: const Size(50, 50),
                      ),
                      backgroundColor: pureWhite,
                      padding: const EdgeInsets.all(15),
                      errorStateBuilder: (cxt, err) {
                        return const Center(
                          child: Text(
                            "Uh oh! Something went wrong...",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFormInput(
                        labelText: "Amount",
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Amount is required";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        hintText: "Enter cash recived",
                        suffixIcon: Icons.money,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        maxInputLength: 5,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const BookingSuccessPage(
                            animationWidget: "assets/lottie_files/confirm.json",
                            statusText: "Booking Successful!",
                          ),
                        ),
                      );
                    },
                    child: const Text("Send Confirmation Link"),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
