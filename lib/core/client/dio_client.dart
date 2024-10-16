import 'dart:io';

import 'package:cek_ongkir/core/client/dio_interceptor.dart';
import 'package:cek_ongkir/core/client/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_parser/http_parser.dart';
import 'package:cek_ongkir/utils/utils.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class DioClient with BoxMixin, FirebaseCrashLogger {
  String baseUrl = dotenv.env['BASE_URL'] as String;
  late Dio _dio;
  DioClient() {
    _dio = _createDio();
    _dio.interceptors.add(DioInterceptor());
  }
  Dio get dio {
    try {
      // _auth = getData(MainBoxKeys.token);
      // _contentType = getData(MainBoxKeys.contentType);
    } catch (_) {}

    final dio = _createDio();

    dio.interceptors.add(DioInterceptor());

    return dio;
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: '$baseUrl/',
          headers: {},
          receiveTimeout: const Duration(minutes: 1),
          connectTimeout: const Duration(minutes: 1),
          validateStatus: (int? status) {
            return true;
          },
        ),
      );

  Future<Either<Failure, T>> getRequest<T>(
    String url, {
    required Map<String, dynamic> queryParam,
    required ResponseConverter<T> converter,
    required Map<String, dynamic> headers,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: queryParam,
        options: Options(headers: headers),
      );
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 202) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      return Right(converter(response.data));
    } on DioException catch (e, stackTrace) {
      nonFatalError(error: e, stackTrace: stackTrace);
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout) {
        return Left(
          ServerFailure(
            504,
            Images.get.icKoneksiError,
            Constants.get.errorTitle504,
            Constants.get.errorSubtitle504,
            null,
          ),
        );
      } else {
        if (e.response?.statusCode == 500 || e.response?.statusCode == 502) {
          return Left(
            ServerFailure(
              e.response?.statusCode,
              Images.get.icWarningRed,
              Constants.get.errorTitle500,
              Constants.get.errorSubtitle500,
              null,
            ),
          );
        }
        if (e.response?.statusCode == 404) {
          return Left(
            ServerFailure(
              e.response?.statusCode,
              Images.get.icFailed,
              Constants.get.errorTitleGeneral,
              Constants.get.errorSubtitleGeneral,
              null,
            ),
          );
        }
        if (e.response?.statusCode == 403) {
          return Left(
            ServerFailure(
              e.response?.statusCode,
              Images.get.icFailed,
              Constants.get.errorTitleGeneral,
              Constants.get.errorSubtitleGeneral,
              null,
            ),
          );
        }
        return Left(
          ServerFailure(
            e.response?.statusCode,
            Images.get.icFailed,
            Constants.get.errorTitleGeneral,
            e.response?.data['responseMessage'] as String? ??
                e.response?.data['message'] as String?,
            e.response?.data['data'],
          ),
        );
      }
    }
  }

  Future<Either<Failure, T>> postRequest<T>(
    String url, {
    required Map<String, dynamic> data,
    required ResponseConverter<T> converter,
    required Map<String, dynamic> headers,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: data,
        options: Options(headers: headers),
      );
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 202) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      return Right(converter(response.data));
    } on DioException catch (e, stackTrace) {
      nonFatalError(error: e, stackTrace: stackTrace);
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout) {
        return Left(
          ServerFailure(
            504,
            Images.get.icKoneksiError,
            Constants.get.errorTitle504,
            Constants.get.errorSubtitle504,
            null,
          ),
        );
      } else {
        if (e.response?.statusCode == 500 || e.response?.statusCode == 502) {
          return Left(
            ServerFailure(
              e.response?.statusCode,
              Images.get.icWarningRed,
              Constants.get.errorTitle500,
              Constants.get.errorSubtitle500,
              null,
            ),
          );
        }
        if (e.response?.statusCode == 404) {
          return Left(
            ServerFailure(
              e.response?.statusCode,
              Images.get.icFailed,
              Constants.get.errorTitleGeneral,
              Constants.get.errorSubtitleGeneral,
              null,
            ),
          );
        }
        if (e.response?.statusCode == 403) {
          return Left(
            ServerFailure(
              e.response?.statusCode,
              Images.get.icFailed,
              Constants.get.errorTitleGeneral,
              Constants.get.errorSubtitleGeneral,
              null,
            ),
          );
        }
        return Left(
          ServerFailure(
            e.response?.statusCode,
            Images.get.icFailed,
            Constants.get.errorTitleGeneral,
            e.response?.data['responseMessage'] as String? ??
                e.response?.data['message'] as String?,
            e.response?.data['data'],
          ),
        );
      }
    }
  }

  Future<Either<Failure, T>> postFormData<T>(
    String url, {
    required Map<String, String> data,
    required Map<String, dynamic> queryParam,
    required ResponseConverter<T> converter,
    Map<String, dynamic>? headers,
    bool isIsolate = true,
  }) async {
    try {
      final header = headers ?? {};

      final FormData formData = FormData.fromMap({});
      await Future.forEach(
        data.entries,
        (MapEntry<String, dynamic> entry) async {
          final String key = entry.key;
          final String value = entry.value.toString();
          if (File(value).existsSync()) {
            formData.files.add(
              MapEntry(
                key,
                await MultipartFile.fromFile(
                  value,
                  filename: value.split('/').last,
                  contentType: MediaType('image', 'jpg'),
                ),
              ),
            );
          } else {
            formData.fields.add(MapEntry(key, value));
          }
        },
      );

      final response = await dio.post(
        url,
        data: formData,
        queryParameters: queryParam,
        options: Options(
          headers: header,
        ),
      );
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 202) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      return Right(converter(response.data));
    } on DioException catch (e, stackTrace) {
      nonFatalError(error: e, stackTrace: stackTrace);
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.connectionTimeout) {
        return Left(
          ServerFailure(
            504,
            Images.get.icKoneksiError,
            Constants.get.errorTitle504,
            Constants.get.errorSubtitle504,
            null,
          ),
        );
      } else {
        if (e.response?.statusCode == 500 || e.response?.statusCode == 502) {
          return Left(
            ServerFailure(
              e.response?.statusCode,
              Images.get.icWarningRed,
              Constants.get.errorTitle500,
              Constants.get.errorSubtitle500,
              null,
            ),
          );
        }
        if (e.response?.statusCode == 404) {
          return Left(
            ServerFailure(
              e.response?.statusCode,
              Images.get.icFailed,
              Constants.get.errorTitleGeneral,
              Constants.get.errorSubtitleGeneral,
              null,
            ),
          );
        }
        if (e.response?.statusCode == 403) {
          return Left(
            ServerFailure(
              e.response?.statusCode,
              Images.get.icFailed,
              Constants.get.errorTitleGeneral,
              Constants.get.errorSubtitleGeneral,
              null,
            ),
          );
        }
        return Left(
          ServerFailure(
            e.response?.statusCode,
            Images.get.icFailed,
            Constants.get.errorTitleGeneral,
            e.response?.data['responseMessage'] as String? ??
                e.response?.data['message'] as String?,
            e.response?.data['data'],
          ),
        );
      }
    }
  }
}
