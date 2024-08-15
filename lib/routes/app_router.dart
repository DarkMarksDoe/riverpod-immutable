import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_inmutable/app/app.dart';
import 'package:riverpod_inmutable/app/detail/detail_controller.dart';
import 'package:riverpod_inmutable/app/detail/detail_page.dart';
import 'package:riverpod_inmutable/app/home/home_page.dart';
import 'package:riverpod_inmutable/routes/app_routes.dart';

/// This provider is responsible for the app router.
///
/// It is used to define the app routes and the initial route.
final myRouter = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: AppRoutes.home,
    navigatorKey: App.navigatorKey,
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (_, __) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.detail,
        name: AppRoutes.detail,
        builder: (_, GoRouterState state) {
          final DetailEntity entity = state.extra as DetailEntity;
          return DetailPage(entity: entity);
        },
      ),
    ],
  ),
);
