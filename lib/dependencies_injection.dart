import 'package:cek_ongkir/view/view.dart';
import 'package:get_it/get_it.dart';
import 'package:cek_ongkir/core/core.dart';
import 'package:cek_ongkir/feature/feature.dart';
import 'package:cek_ongkir/utils/utils.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({
  bool isUnitTest = false,
  bool isHiveEnable = true,
  String prefixBox = '',
}) async {
  if (isUnitTest) {
    await sl.reset();
  }
  sl.registerSingleton<DioClient>(DioClient());
  dataSource();
  repositories();
  useCase();
  cubit();
  await _initHiveBoxes();
}

Future<void> _initHiveBoxes({
  String prefixBox = '',
}) async {
  await BoxMixin.initHive(prefixBox);
  sl.registerSingleton<BoxMixin>(BoxMixin());
}

void repositories() {
  sl.registerLazySingleton<Repository>(
    () => RepositoryImpl(sl(), sl()),
  );
}

void dataSource() {
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(sl()),
  );
}

void useCase() {
  sl.registerLazySingleton(() => GetRequestUseCase(sl()));
  sl.registerLazySingleton(() => PostFormDataUseCase(sl()));
  sl.registerLazySingleton(() => PostRequestUseCase(sl()));
  sl.registerLazySingleton(() => GetDynamicUseCase(sl()));
}

void cubit() {
  sl.registerFactory(() => CekResiCubit(sl(), sl()));
}
