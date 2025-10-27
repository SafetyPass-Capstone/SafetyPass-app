import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safetypass_app/constants/paths.dart';
import 'package:safetypass_app/widgets/atoms/texts/styles.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomLift = MediaQuery.of(context).size.height * 0.12;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 5),
              Column(
                children: [
                  const SizedBox(height: 24),
                  Image.asset('assets/images/main-Logo.png', height: 50, fit: BoxFit.contain
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '재밌는 시간을\n안전하게 보내세요',
                    textAlign: TextAlign.center,
                    style: SafetyPassTextStyle.titleSB24
                  ),
                  const SizedBox(height: 24),
                  Image.asset('assets/images/init-character.png', height: 280, fit: BoxFit.contain),
                ],
              ),

              Padding(
                  padding: EdgeInsets.only(bottom: bottomLift),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: () => context.push(Paths.register),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF120E50),
                      foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: SafetyPassTextStyle.bodySB20),
                    child: const Text('행사장 등록'),
                  ),
                )

              ),
            ],
          ),
        ),
      ),
    );
  }
}
