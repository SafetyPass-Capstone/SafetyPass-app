import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safetypass_app/widgets/atoms/texts/styles.dart';
import 'package:safetypass_app/constants/paths.dart';
import 'package:safetypass_app/constants/colors.dart';

class VenueCompleteScreen extends StatelessWidget {
  const VenueCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SafetyPassColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 8, bottom: 4),
                      child: GestureDetector(
                        onTap: () => context.pop(),
                        child: const Icon(Icons.arrow_back_ios_new_rounded, size: 28),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '행사장 등록 완료',
                      style: SafetyPassTextStyle.titleSB24.copyWith(
                        color: SafetyPassColor.darkBlueAlt,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '안전을 위해서 티켓(좌석)을 등록해주세요',
                      style: SafetyPassTextStyle.bodyR15.copyWith(
                        color: SafetyPassColor.darkBlueAlt,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/ticket-char.png',
                            height: 164,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Text(
                            '올림픽공원 올림픽홀',
                            style: SafetyPassTextStyle.bodySB20.copyWith(
                              color: SafetyPassColor.greenDark,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8FAEC),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: SafetyPassColor.greenDark,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.warning_amber_rounded,
                                color: SafetyPassColor.darkBlueAlt,
                                size: 22,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  '안전한 행사 참여를 위해 티켓(좌석)을 등록하고 \n모든 기능을 이용하세요',
                                  style: SafetyPassTextStyle.bodyR15.copyWith(
                                    color: SafetyPassColor.darkBlueAlt,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => context.push(Paths.ticketInput),
                  style: FilledButton.styleFrom(
                    backgroundColor: SafetyPassColor.darkBlue,
                    foregroundColor: SafetyPassColor.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: SafetyPassTextStyle.bodySB20,
                  ),
                  child: const Text('티켓 정보 직접 입력'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

