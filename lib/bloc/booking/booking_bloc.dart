import 'dart:developer';

import 'package:brechfete/domain/screens/booking/booking_service.dart';
import 'package:brechfete/domain/screens/booking/modals/time_slot/time_slot.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brechfete/domain/common_failures/common_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'booking_event.dart';
part 'booking_state.dart';
part 'booking_bloc.freezed.dart';

@injectable
class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingService bookingService;
  BookingBloc(this.bookingService) : super(BookingState.initial()) {
    on<_GetTime>((event, emit) async {
      emit(
        const BookingState(
          isLoading: true,
          isError: false,
          timeSlotList: [],
        ),
      );

      final Either<CommonFailures, List<TimeSlotModal>> timeSlotList =
          await bookingService.getTime(date: event.date);
      log(timeSlotList.toString());
      emit(
        timeSlotList.fold(
          (CommonFailures failures) {
            return const BookingState(
              isLoading: false,
              isError: true,
              timeSlotList: [],
            );
          },
          (List<TimeSlotModal> data) {
            return BookingState(
              isLoading: false,
              isError: false,
              timeSlotList: data,
            );
          },
        ),
      );
    });
  }
}
