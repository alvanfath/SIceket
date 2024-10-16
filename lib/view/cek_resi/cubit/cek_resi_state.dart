part of 'cek_resi_cubit.dart';

@freezed
class CekResiState with _$CekResiState {
  const factory CekResiState.initial() = _Initial;
  const factory CekResiState.loading() = _Loading;
  const factory CekResiState.error(String error) = _Error;
  const factory CekResiState.failure(ServerFailure error) = _Failure;
  const factory CekResiState.success(Map<String, dynamic> response) = _Success;
}
