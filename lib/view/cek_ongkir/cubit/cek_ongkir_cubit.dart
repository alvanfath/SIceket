import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siceket/core/client/client.dart';
import 'package:siceket/feature/feature.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'cek_ongkir_state.dart';
part 'cek_ongkir_cubit.freezed.dart';

class CekOngkirCubit extends Cubit<CekOngkirState> {
  final GetDynamicUseCase getDynamic;
  final PostDynamicUseCase postDynamic;
  CekOngkirCubit(this.getDynamic, this.postDynamic) : super(const _Loading());

  final listProvinsi = BehaviorSubject<List<dynamic>>.seeded([]);
  final listKotaOrigin = BehaviorSubject<List<dynamic>?>();
  final listKotaDestination = BehaviorSubject<List<dynamic>?>();

  Future<void> getProvinsi() async {
    await Future.delayed(const Duration(milliseconds: 10));
    emit(const _Loading());
    try {
      final response = await getDynamic.call(
        url: 'https://api.rajaongkir.com/starter/province',
        moreHeader: {
          'key': dotenv.env['API_KEY_RAJAONGKIR'].toString(),
        },
      );
      response.fold(
        (left) {
          if (left is ServerFailure) {
            emit(_Failure(left));
          }
        },
        (right) {
          final Map<String, dynamic> data = right['rajaongkir'] ?? {};
          listProvinsi.add(data['results'] ?? []);
          emit(const _Initial());
        },
      );
    } catch (e) {
      emit(_Error(e.toString()));
    }
  }

  Future<void> getCity({
    required PlaceType tipe,
    required String idProvinsi,
  }) async {
    emit(const _Loading());
    if (tipe == PlaceType.origin) {
      listKotaOrigin.add(null);
    } else {
      listKotaDestination.add(null);
    }
    try {
      final response = await getDynamic.call(
        url: 'https://api.rajaongkir.com/starter/city',
        moreHeader: {
          'key': dotenv.env['API_KEY_RAJAONGKIR'].toString(),
        },
        queryParam: {
          'province': idProvinsi,
        },
      );
      response.fold(
        (left) {
          if (left is ServerFailure) {
            emit(_Failure(left));
          }
        },
        (right) {
          final Map<String, dynamic> data = right['rajaongkir'] ?? {};
          if (tipe == PlaceType.origin) {
            listKotaOrigin.add(data['results'] ?? []);
          } else {
            listKotaDestination.add(data['results'] ?? []);
          }
          emit(const _Initial());
        },
      );
    } catch (e) {
      emit(_Error(e.toString()));
    }
  }

  Future<void> cekOngkir(Map<String, dynamic> payload) async {
    emit(const _Loading());
    try {
      final response = await postDynamic.call(
        url: 'https://api.rajaongkir.com/starter/cost',
        data: payload,
        moreHeader: {
          'key': dotenv.env['API_KEY_RAJAONGKIR'].toString(),
        },
      );
      response.fold(
        (left) {
          if (left is ServerFailure) {
            emit(_Failure(left));
          }
        },
        (right) {
          emit(_Success(right['rajaongkir']));
        },
      );
    } catch (e) {
      emit(_Error(e.toString()));
    }
  }
}

enum PlaceType {
  origin,
  destination,
}
