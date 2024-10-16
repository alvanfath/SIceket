import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:oktoast/oktoast.dart';
import 'package:cek_ongkir/dependencies_injection.dart';
import 'package:cek_ongkir/route.dart';
import 'package:cek_ongkir/utils/utils.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await initializeDateFormatting('id_ID', null);
  await dotenv.load(fileName: ".env");
  await serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return OKToast(
      child: ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, __) {
          Routing.setStream(context);
    
          return MaterialApp.router(
            routerConfig: Routing.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Constants.get.primaryColor,
              ),
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: true,
              fontFamily: 'Poppins',
            ),
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData data = MediaQuery.of(context);
    
              return MediaQuery(
                data: data.copyWith(
                  textScaleFactor: 1,
                  alwaysUse24HourFormat: true,
                ),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
