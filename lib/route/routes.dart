import 'package:flutter/material.dart';
import 'package:safetypass_app/constants/paths.dart';
import 'package:go_router/go_router.dart';
import 'package:safetypass_app/screens/splash_screen.dart';

final AppRouter = GoRouter(
  initialLocation: Paths.splash,
  routes: [
    GoRoute(
      path: Paths.splash,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SplashScreen(),
      ),
    ),
  ],
);
