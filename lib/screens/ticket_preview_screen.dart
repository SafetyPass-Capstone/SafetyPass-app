import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../stores/event_store.dart';
import 'package:safetypass_app/widgets/atoms/texts/styles.dart';
import 'package:safetypass_app/constants/colors.dart';

class TicketPreviewScreen extends StatelessWidget {
  const TicketPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ticket = context.watch<EventStore>().ticket;
    return Scaffold(
      backgroundColor: SafetPassColor.white,
      appBar: AppBar(
        backgroundColor: SafetPassColor.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFDBF4E8), Color(0xFFE7F3F8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1F000000),
                    blurRadius: 12,
                    offset: Offset(0, 8),
                  )
                ],
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('[Play & Stay]\n2025 ILLIT GLITTER DAY\nIN SEOUL+ Hotels',
                          style: SafetyPassTextStyle.bodyEB20.copyWith(color: const Color(0xFF1A0A49))),
                      const SizedBox(height: 16),

                      _kv('장소', ticket?.place ?? '-'),
                      _kv('일시', ticket?.date ?? '-'),
                      _kv('이름', ticket?.owner ?? '-'),
                      _kv('좌석', ticket?.seat ?? '-'),
                      _kv('무대 배치', ticket?.zone ?? '-'),
                    ],
                  ),

                  Positioned(
                    right: 0, bottom: 0,
                    child: Image.asset(
                      'assets/images/ticket-char.png',
                      height: 180,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                onPressed: () {
                  // TODO: 홈으로 이동
                  context.go('/'); // 임시
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF1A0A49),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  textStyle: SafetyPassTextStyle.bodyEB17,
                ),
                child: const Text('티켓(좌석) 등록 완료  →'),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _kv(String k, String v) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(k, style: SafetyPassTextStyle.bodySB17.copyWith(color: const Color(0xFF1A0A49))),
          const SizedBox(height: 2),
          Text(v, style: SafetyPassTextStyle.bodyR15.copyWith(color: Colors.black87)),
        ],
      ),
    );
  }
}
