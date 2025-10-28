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
import 'package:safetypass_app/widgets/emergency_button.dart';

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
              _buildInfoText(context),
              const SizedBox(height: 10),
              _buildEmergencyButton(context),
              const SizedBox(height: 30),
              CapacityCard(
                name: name,
                capacity: capacity,
                venue: venueName,
              ),
              const SizedBox(height: 10),
              _buildMyTicketButton(context),
              const SizedBox(height: 10),
              const QuickGrid(
                items: [
                  QuickItem(icon: Icons.local_hospital, label: '보건실 찾기'),
                  QuickItem(icon: Icons.place, label: '입구 / 출구 찾기'),
                  QuickItem(icon: Icons.map, label: '3D 지도 보기'),
                  QuickItem(icon: Icons.forum, label: '행사 장소 커뮤니티'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoText(BuildContext context) {
    return Text(
      '긴급 상황시 앱 자체에서 바로 긴급 모드로 전환할 수 있습니다.',
      style: SafetyPassTextStyle.bodyEB10.copyWith(color: Colors.black54),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildEmergencyButton(BuildContext context) {
    return Center(
      child: EmergencyButton(
        text: '긴급 대피 모드 전환',
        isOn: false,
        onTap: () {
          context.push(Paths.emergency_mode);
        },
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '내 티켓 정보',
              style: SafetyPassTextStyle.bodyEB17,
            ),
            SizedBox(width: 6),
            Icon(Icons.arrow_forward, size: 18, color: ticketButtonColor),
          ],
        ),
      ),
    );
  }
}
