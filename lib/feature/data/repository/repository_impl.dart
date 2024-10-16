import 'package:cek_ongkir/core/client/client.dart';
import 'package:cek_ongkir/feature/data/datasource/remotedata_source.dart';
import 'package:cek_ongkir/feature/data/model/general_response.dart';
import 'package:cek_ongkir/feature/domain/repository/repository.dart';
import 'package:cek_ongkir/utils/service/hive/hive.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final BoxMixin boxMixin;

  const RepositoryImpl(this.remoteDataSource, this.boxMixin);

  @override
  Future<Either<Failure, GeneralResponse>> getRequest({
    required String url,
    required Map<String, dynamic> queryParam,
    required Map<String, String> moreHeader,
  }) async {
    final response = await remoteDataSource.getRequest(
      url: url,
      queryParam: queryParam,
      moreHeader: moreHeader,
    );
    return response.fold(
      (left) => Left(left),
      (right) => Right(right),
    );
  }
  @override
  Future<Either<Failure, dynamic>> getDynamic({
    required String url,
    required Map<String, dynamic> queryParam,
    required Map<String, String> moreHeader,
  }) async {
    final response = await remoteDataSource.getDynamic(
      url: url,
      queryParam: queryParam,
      moreHeader: moreHeader,
    );
    return response.fold(
      (left) => Left(left),
      (right) => Right(right),
    );
  }

  @override
  Future<Either<Failure, GeneralResponse>> postRequest({
    required String url,
    required Map<String, dynamic> data,
    required Map<String, String> moreHeader,
  }) async {
    final response = await remoteDataSource.postRequest(
      url: url,
      data: data,
      moreHeader: moreHeader,
    );
    return response.fold(
      (left) => Left(left),
      (right) => Right(right),
    );
  }

  @override
  Future<Either<Failure, GeneralResponse>> postFormData({
    required String url,
    required Map<String, String> data,
    required Map<String, dynamic> queryParam,
    required Map<String, String> moreHeader,
  }) async {
    final response = await remoteDataSource.postFormData(
      url: url,
      data: data,
      queryParam: queryParam,
      moreHeader: moreHeader,
    );
    return response.fold(
      (left) => Left(left),
      (right) => Right(right),
    );
  }
}
