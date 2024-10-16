abstract class Failure {
  /// ignore: avoid_unused_constructor_parameters
  const Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  final int? statusCode;
  final String image;
  final String titleMessage;
  final String? message;
  final dynamic data;

  const ServerFailure(
    this.statusCode,
    this.image,
    this.titleMessage,
    this.message,
    this.data,
  );

  @override
  bool operator ==(Object other) =>
      other is ServerFailure &&
      other.message == message &&
      other.statusCode == statusCode &&
      other.data == data &&
      other.titleMessage == titleMessage &&
      other.image == image;

  @override
  int get hashCode => message.hashCode;
}

class NoDataFailure extends Failure {
  @override
  bool operator ==(Object other) => other is NoDataFailure;

  @override
  int get hashCode => 0;
}

class CacheFailure extends Failure {
  @override
  bool operator ==(Object other) => other is CacheFailure;

  @override
  int get hashCode => 0;
}
