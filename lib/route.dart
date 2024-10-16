import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cek_ongkir/dependencies_injection.dart';
import 'package:cek_ongkir/view/view.dart';

class Routing {
  static late BuildContext context;
  Routing.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: OnboardingPage.routeName,
        name: OnboardingPage.routeName,
        builder: (_, __) {
          return const OnboardingPage();
        },
      ),
      GoRoute(
        path: CekResiPage.routeName,
        name: CekResiPage.routeName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<CekResiCubit>()..getCourier(),
            child: const CekResiPage(),
          );
        },
      ),
    ],
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    initialLocation: OnboardingPage.routeName,
  );
}
