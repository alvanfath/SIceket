import 'package:siceket/core/client/client.dart';
import 'package:siceket/feature/data/model/general_response.dart';
import 'package:siceket/feature/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class PostFormDataUseCase {
  final Repository _repository;

  const PostFormDataUseCase(this._repository);

  Future<Either<Failure, GeneralResponse>> call({
    required String url,
    required Map<String, String> data,
    Map<String, dynamic> queryParam = const {},
    Map<String, String> moreHeader = const {},
  }) async {
    return _repository.postFormData(
      url: url,
      data: data,
      queryParam: queryParam,
      moreHeader: moreHeader,
    );
  }
}
