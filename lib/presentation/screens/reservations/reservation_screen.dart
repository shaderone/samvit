import 'package:samvit/bloc/reservation/reservation_bloc.dart';
import 'package:samvit/domain/screens/reservation/reservation/reservation.dart';
import 'package:samvit/presentation/screens/bookings/booking_screen.dart';
import 'package:samvit/presentation/screens/reservations/widgets/reservation_card_widgets/reservation_cards.dart';
import 'package:flutter/material.dart';
import 'package:samvit/core/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

const extraSmallScreenWidth = 320;

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      return context
          .read<ReservationBloc>()
          .add(const ReservationEvent.getReservationList());
    });

    final screenWidth = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      color: secondaryBlueShadeLight,
      strokeWidth: 2,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async => context
          .read<ReservationBloc>()
          .add(const ReservationEvent.getReservationList()),
      child: Scaffold(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset("assets/images/samvit_logo.png", width: 30),
              ),
              const SizedBox(width: 15),
              GradientText(
                'Reservation list',
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
        ),
        body: BlocBuilder<ReservationBloc, ReservationState>(
          builder: (context, state) {
            if (state.isLoading) {
              EasyLoading.instance.indicatorType =
                  EasyLoadingIndicatorType.wave;
              EasyLoading.show(status: 'Getting Data...');
              return const SizedBox();
            } else if (state.reservationList.isEmpty) {
              EasyLoading.dismiss();
              return const Center(
                child: Text("List is empty!"),
              );
            } else {
              EasyLoading.dismiss();
              return AnimationLimiter(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final singleReservationListItem =
                        state.reservationList[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child:
                              ReservationCard(state: singleReservationListItem),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: state.reservationList.length,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  final ReservationModal state;
  const ReservationCard({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
      color: textWhiteShadeDark.withOpacity(.075),
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
            const SizedBox(height: 5),
            CardTop(state: state),
            screenWidth <= extraSmallScreenWidth
                ? const SizedBox(height: 10)
                : const SizedBox(height: 5),
            Divider(color: textWhiteShadeDark.withOpacity(.5)),
            const SizedBox(height: 5),
            CardMiddle(state: state),
          ],
        ),
      ),
    );
  }
}
