import 'dart:convert';
import 'dart:developer';

import 'package:brechfete/bloc/paynow/paynow_bloc.dart';
import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:brechfete/presentation/screens/bookings/pages/booking_success_page.dart';
import 'package:brechfete/presentation/screens/bookings/pages/widgets/registration_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PayNowPage extends StatefulWidget {
  static final _amountFormKey = GlobalKey<FormState>();
  const PayNowPage({Key? key}) : super(key: key);

  @override
  State<PayNowPage> createState() => _PayNowPageState();
}

class _PayNowPageState extends State<PayNowPage> {
  bool isQrCodeGenerated = false;
  String qrData = "";
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
                    Text(
                      "Ready Cash",
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
                    Text(
                      "Online",
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
            SingleChildScrollView(
              child: Form(
                key: PayNowPage._amountFormKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: extraYellow.withOpacity(.05),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: extraYellow.withOpacity(.5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: const [
                                      TextSpan(
                                        text:
                                            "Amount to Pay : 20 x 40 (slots) = ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: textWhiteShadeLight,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "800 ₹",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomFormInput(
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
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
                          PayNowPage._amountFormKey.currentState!.validate();
                          if (PayNowPage._amountFormKey.currentState!
                              .validate()) {
                            //print("success");
                            //reseting
                            isRegistrationSuccessNotifier.value = false;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const BookingSuccessPage(
                                  animationWidget:
                                      "assets/lottie_files/confirm.json",
                                  statusText: "Booking Successful!",
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text("Send Confirmation Link"),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
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
                    onPressed: () async {
                      //reseting
                      isRegistrationSuccessNotifier.value = false;
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      final reg_id = await prefs.getString("regToken");

                      var client = http.Client();
                      var response = await client.post(
                        Uri.parse(
                          "$baseURL/payment/",
                        ),
                        headers: {
                          "Content-Type": "application/json",
                        },
                        body: jsonEncode(
                          {
                            'collegeid': reg_id,
                            'type': "online",
                          },
                        ),
                      );
                      final data = jsonDecode(
                        response.body.toString(),
                      );

                      //Navigator.of(context).pushReplacement(
                      //  MaterialPageRoute(
                      //    builder: (context) => const BookingSuccessPage(
                      //      animationWidget: "assets/lottie_files/confirm.json",
                      //      statusText: "Booking Successful!",
                      //    ),
                      //  ),
                      //);
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
                  Column(
                    children: [
                      TextButton(
                        onPressed: () async {
                          context.read<PaynowBloc>().add(
                                const PaynowEvent.generateQrCode(),
                              );
                        },
                        child: const Text("Generate QR code"),
                      ),
                      BlocBuilder<PaynowBloc, PaynowState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            );
                          } else {
                            return Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: QrImage(
                                    data: state.paymentUrl.url,
                                    version: QrVersions.auto,
                                    size: screenWidth <= 320 ? 150 : 250,
                                    gapless: false,
                                    embeddedImage: const AssetImage(
                                      'assets/images/samvit_logo.png',
                                    ),
                                    embeddedImageStyle: QrEmbeddedImageStyle(
                                      size: const Size(50, 50),
                                    ),
                                    backgroundColor: pureWhite,
                                    padding: const EdgeInsets.all(15),
                                    //foregroundColor: extraGreen,
                                    //dataModuleStyle: const QrDataModuleStyle(
                                    //  color: extraRed,
                                    //  dataModuleShape: QrDataModuleShape.square,
                                    //),
                                    constrainErrorBounds: false,
                                    embeddedImageEmitsError: true,
                                    //errorCorrectionLevel: 1,
                                    //eyeStyle: const QrEyeStyle(
                                    //  color: extraYellow,
                                    //  eyeShape: QrEyeShape.circle,
                                    //),
                                    errorStateBuilder: (cxt, err) {
                                      return const Center(
                                        child: Text(
                                          "Uh oh! Something went wrong...",
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 30),
                                SizedBox(
                                  width: 250,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        secondaryBlueShadeLight.withOpacity(.1),
                                      ),
                                      side: MaterialStateProperty.all(
                                        const BorderSide(
                                            color: secondaryBlueShadeDark),
                                      ),
                                    ),
                                    onPressed: () {
                                      print("check payment progress");
                                    },
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      child: Text("Check progress"),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
