import 'package:siceket/core/client/client.dart';
import 'package:siceket/feature/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class PostDynamicUseCase {
  final Repository _repository;

  const PostDynamicUseCase(this._repository);

  Future<Either<Failure, dynamic>> call({
    required String url,
    required Map<String, dynamic> data,
    Map<String, String> moreHeader = const {},
  }) async {
    return _repository.postDynamic(
      url: url,
      data: data,
      moreHeader: moreHeader,
    );
  }
}
