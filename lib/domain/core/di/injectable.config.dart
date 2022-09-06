// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../bloc/booking/booking_bloc.dart' as _i12;
import '../../../bloc/paynow/paynow_bloc.dart' as _i7;
import '../../../bloc/reservation/reservation_bloc.dart' as _i13;
import '../../../bloc/slot_info/slot_info_bloc.dart' as _i14;
import '../../../infrastructure/booking/booking_repository.dart' as _i4;
import '../../../infrastructure/booking/pages/pay_now_repository.dart' as _i6;
import '../../../infrastructure/booking/slot_info_repository.dart' as _i11;
import '../../../infrastructure/reservation/reservation_repository.dart' as _i9;
import '../../screens/booking/booking_service.dart' as _i3;
import '../../screens/booking/pages/pay_now_service.dart' as _i5;
import '../../screens/booking/slot_info_service.dart' as _i10;
import '../../screens/reservation/reservation_service.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.BookingService>(() => _i4.BookingRepository());
  gh.lazySingleton<_i5.PayNowService>(() => _i6.PayNowRepository());
  gh.factory<_i7.PaynowBloc>(() => _i7.PaynowBloc(get<_i5.PayNowService>()));
  gh.lazySingleton<_i8.ReservationService>(() => _i9.ReservationRepository());
  gh.lazySingleton<_i10.SlotInfoService>(() => _i11.SlotInfoRepository());
  gh.factory<_i12.BookingBloc>(
      () => _i12.BookingBloc(get<_i3.BookingService>()));
  gh.factory<_i13.ReservationBloc>(
      () => _i13.ReservationBloc(get<_i8.ReservationService>()));
  gh.factory<_i14.SlotInfoBloc>(
      () => _i14.SlotInfoBloc(get<_i10.SlotInfoService>()));
  return get;
}
