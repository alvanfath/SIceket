import 'package:siceket/core/client/client.dart';
import 'package:siceket/feature/data/model/general_response.dart';
import 'package:siceket/utils/service/hive/hive.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteDataSource {
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

class RemoteDataSourceImpl with BoxMixin implements RemoteDataSource {
  final DioClient _client;
  RemoteDataSourceImpl(this._client);

  @override
  Future<Either<Failure, GeneralResponse>> getRequest({
    required String url,
    required Map<String, dynamic> queryParam,
    required Map<String, String> moreHeader,
  }) async {
    Map<String, String> header = {};

    final headers = {
      ...header,
      ...moreHeader,
    };
    final response = _client.getRequest(
      url,
      queryParam: queryParam,
      converter: (response) => GeneralResponse.fromJson(response),
      headers: headers,
    );
    return response;
  }

  @override
  Future<Either<Failure, dynamic>> getDynamic({
    required String url,
    required Map<String, dynamic> queryParam,
    required Map<String, String> moreHeader,
  }) async {
    Map<String, String> header = {};

    final headers = {
      ...header,
      ...moreHeader,
    };
    final response = _client.getRequest(
      url,
      queryParam: queryParam,
      converter: (res) => res,
      headers: headers,
    );
    return response;
  }

  @override
  Future<Either<Failure, GeneralResponse>> postRequest({
    required String url,
    required Map<String, dynamic> data,
    required Map<String, String> moreHeader,
  }) async {
    Map<String, String> header = {};

    final headers = {
      ...header,
      ...moreHeader,
    };
    final response = _client.postRequest(
      url,
      data: data,
      converter: (response) => GeneralResponse.fromJson(response),
      headers: headers,
    );
    return response;
  }

  @override
  Future<Either<Failure, dynamic>> postDynamic({
    required String url,
    required Map<String, dynamic> data,
    required Map<String, String> moreHeader,
  }) async {
    Map<String, String> header = {};

    final headers = {
      ...header,
      ...moreHeader,
    };
    final response = _client.postRequest(
      url,
      data: data,
      converter: (res) => res,
      headers: headers,
    );
    return response;
  }

  @override
  Future<Either<Failure, GeneralResponse>> postFormData({
    required String url,
    required Map<String, String> data,
    required Map<String, dynamic> queryParam,
    required Map<String, String> moreHeader,
  }) async {
    Map<String, String> header = {};

    final headers = {
      ...header,
      ...moreHeader,
    };
    final response = _client.postFormData(
      url,
      data: data,
      queryParam: queryParam,
      converter: (response) => GeneralResponse.fromJson(response),
      headers: headers,
    );
    return response;
  }
}
