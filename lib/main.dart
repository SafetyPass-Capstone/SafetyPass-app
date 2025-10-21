import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safetypass_app/route/routes.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        /// 앱 전역으로 공유할 상태 추가
        //ChangeNotifierProvider(create: (_) => ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return child!;
      },
    );
  }
}
