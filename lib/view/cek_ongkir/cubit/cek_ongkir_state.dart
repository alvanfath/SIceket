part of 'cek_ongkir_cubit.dart';

@freezed
class CekOngkirState with _$CekOngkirState {
  const factory CekOngkirState.initial() = _Initial;
  const factory CekOngkirState.loading() = _Loading;
  const factory CekOngkirState.error(String error) = _Error;
  const factory CekOngkirState.failure(ServerFailure fail) = _Failure;
  const factory CekOngkirState.success(Map<String,dynamic> data) = _Success;
}
