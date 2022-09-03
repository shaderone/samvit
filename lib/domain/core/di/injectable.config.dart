// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../bloc/booking/booking_bloc.dart' as _i7;
import '../../../bloc/slot_info/slot_info_bloc.dart' as _i8;
import '../../../infrastructure/booking/booking_repository.dart' as _i4;
import '../../../infrastructure/booking/slot_info_repository.dart' as _i6;
import '../../screens/booking/booking_service.dart' as _i3;
import '../../screens/booking/slot_info_service.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.BookingService>(() => _i4.BookingRepository());
  gh.lazySingleton<_i5.SlotInfoService>(() => _i6.SlotInfoRepository());
  gh.factory<_i7.BookingBloc>(() => _i7.BookingBloc(get<_i3.BookingService>()));
  gh.factory<_i8.SlotInfoBloc>(
      () => _i8.SlotInfoBloc(get<_i5.SlotInfoService>()));
  return get;
}
