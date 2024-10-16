import 'package:siceket/core/client/client.dart';
import 'package:siceket/feature/data/model/general_response.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, GeneralResponse>> getRequest({
    required String url,
    required Map<String, dynamic> queryParam,
    required Map<String, String> moreHeader,
  });
  Future<Either<Failure, dynamic>> getDynamic({
    required String url,
    required Map<String, dynamic> queryParam,
    required Map<String, String> moreHeader,
  });
  Future<Either<Failure, GeneralResponse>> postRequest({
    required String url,
    required Map<String, dynamic> data,
    required Map<String, String> moreHeader,
  });
  Future<Either<Failure, dynamic>> postDynamic({
    required String url,
    required Map<String, dynamic> data,
    required Map<String, String> moreHeader,
  });
  Future<Either<Failure, GeneralResponse>> postFormData({
    required String url,
    required Map<String, String> data,
    required Map<String, dynamic> queryParam,
    required Map<String, String> moreHeader,
  });
}
