import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:safetypass_app/stores/event_store.dart';
import 'package:safetypass_app/models/event_models.dart';
import 'package:safetypass_app/constants/paths.dart';
import 'package:safetypass_app/widgets/atoms/texts/styles.dart';
import 'package:safetypass_app/constants/colors.dart';

import 'package:safetypass_app/widgets/cards/capacity_card.dart';
import 'package:safetypass_app/widgets/cards/quick_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TicketInfo? t = context.watch<EventStore>().ticket;

    final name = t?.owner ?? '장민영';
    final capacity =
        context.watch<EventStore>().venue?.capacity?.toString() ?? '3000';
    final venueName = t?.place ?? '올림픽 공원 올림픽홀';

    return WillPopScope(
      onWillPop: () async {
        context.go(Paths.register);
        return false;
      },
      child: Scaffold(
        backgroundColor: SafetyPassColor.white,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 24),
            children: [
              _buildInfoText(),
              const SizedBox(height: 10),
              _buildEmergencyButton(),
              const SizedBox(height: 20),
              CapacityCard(
                name: name,
                capacity: capacity,
                venue: venueName,
              ),
              const SizedBox(height: 16),
              _buildMyTicketButton(context),
              const SizedBox(height: 40),
              QuickGrid(
                items: [
                  QuickItem(
                      icon: Icons.local_hospital,
                      label: '보건실 찾기'),
                  QuickItem(
                      icon: Icons.place,
                      label: '입구 / 출구 찾기'),
                  QuickItem(
                      icon: Icons.map,
                      label: '3D 지도 보기'),
                  QuickItem(
                      icon: Icons.forum,
                      label: '행사 장소 커뮤니티'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoText() {
    return Text(
      '긴급 상황시 앱 좌측에서 바로 긴급 모드로 전환할 수 있습니다.',
      style: SafetyPassTextStyle.bodyEB10.copyWith(color: Colors.black54),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildEmergencyButton() {
    return OutlinedButton(
      onPressed: () {}, // TODO: 긴급모드 화면/상태 연결
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: SafetyPassColor.systemRed, width: 2),
        foregroundColor: SafetyPassColor.systemRed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: const Text(
        '긴급 대피 모드 전환',
        style: SafetyPassTextStyle.bodyEB17,
      ),
    );
  }

  Widget _buildMyTicketButton(BuildContext context) {
    const ticketButtonColor = Color(0xFF11AD79);

    return Align(
      alignment: Alignment.centerRight,
      child: OutlinedButton(
        onPressed: () => context.push(Paths.ticketPreview, extra: false),
        style: OutlinedButton.styleFrom(
          foregroundColor: ticketButtonColor,
          side: const BorderSide(color: Color(0xFFDBDBDB)),
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '내 티켓 정보',
              style: SafetyPassTextStyle.bodyEB17,
            ),
            const SizedBox(width: 6),
            const Icon(Icons.arrow_forward, size: 18, color: ticketButtonColor),
          ],
        ),
      ),
    );
  }
}