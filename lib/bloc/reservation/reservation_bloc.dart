import 'dart:developer';

import 'package:samvit/domain/screens/reservation/reservation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samvit/domain/common_failures/common_failures.dart';
import 'package:samvit/domain/screens/reservation/reservation/reservation.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';
part 'reservation_bloc.freezed.dart';

@injectable
class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final ReservationService reservationService;
  ReservationBloc(this.reservationService) : super(ReservationState.initial()) {
    on<_GetReservationList>((event, emit) async {
      emit(
        const ReservationState(
          isLoading: true,
          isError: false,
          reservationList: [],
        ),
      );

      Either<CommonFailures, List<ReservationModal>> getReservationResponse =
          await reservationService.getReservationList();

      final reservationState =
          getReservationResponse.fold((CommonFailures failure) {
        return const ReservationState(
          isLoading: false,
          isError: true,
          reservationList: [],
        );
      }, (List<ReservationModal> data) {
        return ReservationState(
          isLoading: false,
          isError: true,
          reservationList: data,
        );
      });

      emit(reservationState);
    });
  }
}
