import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safetypass_app/constants/paths.dart';
import 'package:safetypass_app/screens/splash_screen.dart';
import 'package:safetypass_app/screens/landing_screen.dart';
import 'package:safetypass_app/screens/register_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Paths.splash,
  routes: [
    GoRoute(
      path: Paths.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Paths.landing,
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      path: Paths.register,
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
