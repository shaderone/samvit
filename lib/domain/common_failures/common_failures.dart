import 'package:freezed_annotation/freezed_annotation.dart';
part 'common_failures.freezed.dart';

@freezed
class CommonFailures with _$CommonFailures {
  const factory CommonFailures.clientFailure() = _ClientFailure;
  const factory CommonFailures.serverFailure() = _ServerFailure;
}
