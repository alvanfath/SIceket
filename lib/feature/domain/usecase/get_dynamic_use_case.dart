import 'package:cek_ongkir/core/client/client.dart';
import 'package:cek_ongkir/feature/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetDynamicUseCase {
  final Repository _repository;

  const GetDynamicUseCase(this._repository);

  Future<Either<Failure, dynamic>> call({
    required String url,
    Map<String, dynamic> queryParam = const {},
    Map<String, String> moreHeader = const {},
  }) async {
    return _repository.getDynamic(
      url: url,
      queryParam: queryParam,
      moreHeader: moreHeader,
    );
  }
}
