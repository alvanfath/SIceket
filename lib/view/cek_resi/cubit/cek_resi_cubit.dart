import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cek_ongkir/core/core.dart';
import 'package:cek_ongkir/feature/feature.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'cek_resi_state.dart';
part 'cek_resi_cubit.freezed.dart';

class CekResiCubit extends Cubit<CekResiState> {
  final GetDynamicUseCase getDynamic;
  final GetRequestUseCase getRequest;
  CekResiCubit(this.getDynamic, this.getRequest) : super(const _Loading());
  final listCourir = BehaviorSubject<List<dynamic>>.seeded([]);

  Future<void> getCourier() async {
    await Future.delayed(const Duration(milliseconds: 10));
    emit(const _Loading());
    try {
      final response = await getDynamic.call(
        url: 'v1/list_courier',
      );
      response.fold(
        (left) {
          if (left is ServerFailure) {
            emit(_Failure(left));
          }
        },
        (right) {
          listCourir.add(right);
          emit(const _Initial());
        },
      );
    } catch (e) {
      print(e.toString());
      emit(_Error(e.toString()));
    }
  }

  Future<void> cekResi({
    required String noResi,
    required String code,
  }) async {
    emit(const _Loading());
    try {
      final response = await getRequest.call(
        url: 'v1/track',
        queryParam: {
          'courier': code,
          'awb': noResi,
        },
      );
      response.fold(
        (left) {
          if (left is ServerFailure) {
            emit(_Failure(left));
          }
        },
        (right) {
          emit(_Success(right.data));
        },
      );
    } catch (e) {
      emit(_Error(e.toString()));
    }
  }
}
