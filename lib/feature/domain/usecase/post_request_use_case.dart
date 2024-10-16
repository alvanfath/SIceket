import 'package:cek_ongkir/core/client/client.dart';
import 'package:cek_ongkir/feature/data/model/general_response.dart';
import 'package:cek_ongkir/feature/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class PostRequestUseCase {
  final Repository _repository;

  const PostRequestUseCase(this._repository);

  Future<Either<Failure, GeneralResponse>> call({
    required String url,
    required Map<String, dynamic> data,
    Map<String, String> moreHeader = const {},
  }) async {
    return _repository.postRequest(
      url: url,
      data: data,
      moreHeader: moreHeader,
    );
  }
}
