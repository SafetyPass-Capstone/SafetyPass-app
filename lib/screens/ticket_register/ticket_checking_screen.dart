import 'package:flutter/material.dart';
import 'package:safetypass_app/widgets/atoms/texts/styles.dart';
import 'package:safetypass_app/constants/colors.dart';

class TicketCheckingScreen extends StatelessWidget {
  const TicketCheckingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SafetyPassColor.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/ticket-checking-char.png',
                  height: 150, fit: BoxFit.contain),
              const SizedBox(height: 12),
              Text('티켓 확인 중 ...',
                  style: SafetyPassTextStyle.bodySB17
                      .copyWith(color: const Color(0xFF120E50))),
            ],
          ),
        ),
      ),
    );
  }
}
