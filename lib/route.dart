import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:siceket/dependencies_injection.dart';
import 'package:siceket/view/view.dart';

class CustomPageTransition extends PageRouteBuilder {
  final Widget page;
  final AxisDirection direction;
  final Duration transitionDuration;
  final Duration reverseTransitionDuration;

  CustomPageTransition({
    required this.page,
    this.direction = AxisDirection.right,
    this.transitionDuration = const Duration(milliseconds: 200),
    this.reverseTransitionDuration = const Duration(milliseconds: 200),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: transitionDuration,
          reverseTransitionDuration: reverseTransitionDuration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            Offset getOffsetBegin() {
              switch (direction) {
                case AxisDirection.up:
                  return const Offset(0, 1);
                case AxisDirection.down:
                  return const Offset(0, -1);
                case AxisDirection.right:
                  return const Offset(-1, 0);
                case AxisDirection.left:
                  return const Offset(1, 0);
                default:
                  return const Offset(1, 0);
              }
            }

            final offsetAnimation = Tween<Offset>(
              begin: getOffsetBegin(),
              end: Offset.zero,
            ).animate(animation);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}

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
      GoRoute(
        path: CekOngkirPage.routeName,
        name: CekOngkirPage.routeName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<CekOngkirCubit>()..getProvinsi(),
            child: const CekOngkirPage(),
          );
        },
      ),
    ],
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    initialLocation: OnboardingPage.routeName,
  );
}
