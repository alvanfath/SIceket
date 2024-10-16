import 'package:siceket/utils/service/constant/constants.dart';
import 'package:siceket/utils/service/firebase/firebase_crash.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum KeyStorage {
  accessToken,
  refreshToken,
  idBorrower,
}

mixin class BoxMixin {
  static late Box? mainBox;
  static final String _boxName = Constants.get.appName;
  static Future<void> initHive(String prefixBox) async {
    // Initialize hive (persistent database)
    await Hive.initFlutter();
    mainBox = await Hive.openBox("$prefixBox$_boxName");
  }

  Future<void> addData<T>(KeyStorage key, T value) async {
    await mainBox?.put(key.name, value);
  }

  Future<void> removeData(KeyStorage key) async {
    await mainBox?.delete(key.name);
  }

  T getData<T>(KeyStorage key) => mainBox?.get(key.name) as T;

  Future<void> logoutBox() async {
    /// Clear the box
    removeData(KeyStorage.accessToken);
    removeData(KeyStorage.refreshToken);
  }

  Future<void> closeBox({bool isUnitTest = false}) async {
    try {
      if (mainBox != null) {
        await mainBox?.close();
        await mainBox?.deleteFromDisk();
      }
    } catch (e, stackTrace) {
      if (!isUnitTest) {
        FirebaseCrashLogger().nonFatalError(error: e, stackTrace: stackTrace);
      }
    }
  }
}
