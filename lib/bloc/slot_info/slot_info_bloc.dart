import 'dart:developer';

import 'package:brechfete/domain/common_failures/common_failures.dart';
import 'package:brechfete/domain/screens/booking/slot_info_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brechfete/domain/screens/booking/modals/slot_info/slot_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'slot_info_event.dart';
part 'slot_info_state.dart';
part 'slot_info_bloc.freezed.dart';

@injectable
class SlotInfoBloc extends Bloc<SlotInfoEvent, SlotInfoState> {
  final SlotInfoService slotInfoService;
  SlotInfoBloc(this.slotInfoService) : super(SlotInfoState.initial()) {
    on<SlotInfoEvent>((event, emit) async {
      emit(
        const SlotInfoState(
          isError: false,
          isLoading: true,
          slotInfo: SlotInfoModal(
            remainingSlot: 0,
            bookedSlot: 0,
          ),
        ),
      );

      //send api request
      final Either<CommonFailures, SlotInfoModal> slotInfoResponse =
          await slotInfoService.getSlotInfo(
        date: event.date,
        time: event.time,
      );

      log(slotInfoResponse.toString());

      final slotState = slotInfoResponse.fold((CommonFailures failures) {
        return const SlotInfoState(
          isError: true,
          isLoading: false,
          slotInfo: SlotInfoModal(remainingSlot: 0, bookedSlot: 0),
        );
      }, (SlotInfoModal data) {
        return SlotInfoState(
          isError: false,
          isLoading: false,
          slotInfo: SlotInfoModal(
            remainingSlot: data.remainingSlot,
            bookedSlot: data.bookedSlot,
          ),
        );
      });

      emit(slotState);
    });
  }
}
