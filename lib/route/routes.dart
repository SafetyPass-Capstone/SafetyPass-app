import 'package:flutter/material.dart';
import 'package:safetypass_app/constants/paths.dart';
import 'package:go_router/go_router.dart';
import 'package:safetypass_app/constants/paths.dart';
import 'package:safetypass_app/screens/emergency_mode/emergency_mode_screen.dart';
import 'package:safetypass_app/screens/splash_screen.dart';
import 'package:safetypass_app/screens/landing_screen.dart';
import 'package:safetypass_app/screens/ticket_register/register_screen.dart';
import 'package:safetypass_app/screens/ticket_register/ticket_scan_screen.dart';
import 'package:safetypass_app/screens/ticket_register/ticket_checking_screen.dart';
import 'package:safetypass_app/screens/ticket_register/ticket_preview_screen.dart';
import 'package:safetypass_app/screens/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Paths.emergency_mode,
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
    GoRoute(
      path: Paths.scan,
      builder: (context, state) => const TicketScanScreen(),
    ),
    GoRoute(
      path: Paths.ticketChecking,
      builder: (context, state) => const TicketCheckingScreen(),
    ),
    GoRoute(
      path: Paths.ticketPreview,
      builder: (context, state) =>
          TicketPreviewScreen(showSubmit: (state.extra as bool?) ?? true),
    ),
    GoRoute(
      path: Paths.home,
      builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: Paths.emergency_mode,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const EmergencyModeScreen(),
      ),
    ),
  ],
);
