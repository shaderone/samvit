import 'dart:convert';
import 'dart:developer';

import 'package:brechfete/bloc/paynow/paynow_bloc.dart';
import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:brechfete/presentation/screens/bookings/pages/booking_success_page.dart';
import 'package:brechfete/presentation/screens/bookings/pages/expo_registration_page.dart';
import 'package:brechfete/presentation/screens/bookings/pages/widgets/registration_form_builder.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/slot_status_widgets/slot_info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PayNowPage extends StatefulWidget {
  static final _amountFormKey = GlobalKey<FormState>();
  const PayNowPage({Key? key}) : super(key: key);

  @override
  State<PayNowPage> createState() => _PayNowPageState();
}

class _PayNowPageState extends State<PayNowPage> {
  bool isQrCodeGenerated = false;
  String qrData = "";
  int? amount;
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
                      //Row(
                      //  children: [
                      //    Expanded(
                      //      child: Container(
                      //        decoration: BoxDecoration(
                      //          color: extraYellow.withOpacity(.05),
                      //          borderRadius: BorderRadius.circular(5),
                      //          border: Border.all(
                      //            color: extraYellow.withOpacity(.5),
                      //          ),
                      //        ),
                      //        child: Padding(
                      //          padding: const EdgeInsets.all(15.0),
                      //          child: RichText(
                      //            textAlign: TextAlign.center,
                      //            text: TextSpan(
                      //              style: DefaultTextStyle.of(context).style,
                      //              children: const [
                      //                TextSpan(
                      //                  text:
                      //                      "Amount to Pay : 20 x 40 (slots) = ",
                      //                  style: TextStyle(
                      //                    fontSize: 14,
                      //                    color: textWhiteShadeLight,
                      //                  ),
                      //                ),
                      //                TextSpan(
                      //                  text: "800 ₹",
                      //                  style: TextStyle(
                      //                    fontSize: 16,
                      //                    fontWeight: FontWeight.bold,
                      //                  ),
                      //                ),
                      //              ],
                      //            ),
                      //          ),
                      //        ),
                      //      ),
                      //    ),
                      //  ],
                      //),
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
                            onChanged: (val) {
                              if (PayNowPage._amountFormKey.currentState!
                                  .validate()) {
                                setState(() {
                                  amount = int.parse(val);
                                });
                              }
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () async {
                          PayNowPage._amountFormKey.currentState!.validate();
                          if (PayNowPage._amountFormKey.currentState!
                              .validate()) {
                            //print("success");
                            //reseting
                            isRegistrationSuccessNotifier.value = false;
                            ////new reset
                            //isValidatedNotifier.value = false;
                            SlotInputItem.isSlotCountValidatedNotifier.value =
                                false;

                            //send request
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            final token = prefs.getString("token");
                            final regId = prefs.getString("regToken");
                            EasyLoading.instance.textColor =
                                secondaryBlueShadeLight;
                            EasyLoading.show(
                              status: 'processing...',
                            );
                            var client = http.Client();
                            var response = await client.post(
                              Uri.parse(
                                "$baseURL/payment/",
                              ),
                              headers: {
                                "Content-Type": "application/json",
                                "Authorization": "Token $token"
                              },
                              body: jsonEncode(
                                {
                                  "collegeid": regId,
                                  "type": "cod",
                                  "amount": amount,
                                },
                              ),
                            );
                            EasyLoading.dismiss();
                            log(response.body.toString());
                            final data = jsonDecode(response.body);

                            if (data['is_booked']) {
                              if (!mounted) return;
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BookingSuccessPage(
                                    animationWidget:
                                        "assets/lottie_files/confirm.json",
                                    statusText: "Payment link sent!",
                                  ),
                                ),
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: data["error"],
                                textColor: extraRed,
                              );
                            }
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
                  BlocBuilder<PaynowBloc, PaynowState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(
                            50,
                          ), // fromHeight use double.infinity as width and 40 is the height
                        ),
                        onPressed: () async {
                          //reseting
                          isRegistrationSuccessNotifier.value = false;
                          //new reset
                          //isValidatedNotifier.value = false;
                          SlotInputItem.isSlotCountValidatedNotifier.value =
                              false;

                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          final token = prefs.getString("token");
                          final regId = prefs.getString("regToken");
                          EasyLoading.instance.textColor =
                              secondaryBlueShadeLight;
                          EasyLoading.show(
                            status: 'processing...',
                          );
                          var client = http.Client();
                          var response = await client.post(
                            Uri.parse(
                              "$baseURL/payment/",
                            ),
                            headers: {
                              "Content-Type": "application/json",
                              "Authorization": "Token $token"
                            },
                            body: jsonEncode(
                              {"collegeid": regId, "type": "online"},
                            ),
                          );
                          EasyLoading.dismiss();
                          //log(response.body.toString());
                          final data = jsonDecode(response.body);

                          log(data.toString());
                          if (data['is_mail_sent']) {
                            if (!mounted) return;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const BookingSuccessPage(
                                  animationWidget:
                                      "assets/lottie_files/confirm.json",
                                  statusText: "Booking Successful!",
                                ),
                              ),
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: "Unable to send mail!",
                              textColor: extraRed,
                            );
                          }
                        },
                        child: const Text("Send Payment Link"),
                      );
                    },
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
