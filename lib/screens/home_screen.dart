import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../stores/event_store.dart';
import '../models/event_models.dart';
import '../constants/paths.dart';
import 'package:safetypass_app/widgets/atoms/texts/styles.dart';
import 'package:safetypass_app/constants/colors.dart';

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
        backgroundColor: SafetPassColor.white,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 24),
            children: [
              Text(
                '긴급 상황시 앱 좌측에서 바로 긴급 모드로 전환할 수 있습니다.',
                style: SafetyPassTextStyle.bodyEB10.copyWith(color: Colors.black54),
              ),
              const SizedBox(height: 10),

              // TODO: 긴급모드 화면/상태 연결
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFF3B30), width: 2),
                  foregroundColor: const Color(0xFFFF3B30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  '긴급 대피 모드 전환',
                  style: SafetyPassTextStyle.bodyEB17,
                ),
              ),

              const SizedBox(height: 20),

              _CapacityCard(
                name: name,
                capacity: capacity,
                venue: venueName,
                onTicketPressed: () => context.push(Paths.ticketPreview, extra: false),
              ),

              const SizedBox(height: 40),

              _QuickGrid(
                items: [
                  _QuickItem(icon: Icons.local_hospital_outlined, label: '보건실 찾기', onTap: () {}),
                  _QuickItem(icon: Icons.place_outlined,           label: '입구 / 출구 찾기', onTap: () {}),
                  _QuickItem(icon: Icons.map_outlined,             label: '3D 지도 보기',   onTap: () {}),
                  _QuickItem(icon: Icons.chat_bubble_outline,      label: '행사 장소 커뮤니티', onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    ); // <-- WillPopScope 닫힘
  }
}


class _CapacityCard extends StatelessWidget {
  const _CapacityCard({
    required this.name,
    required this.capacity,
    required this.venue,
    required this.onTicketPressed,
  });

  final String name;
  final String capacity;
  final String venue;
  final VoidCallback onTicketPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEAF7F2), Color(0xFFEAF4FB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 6))],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('현재 $name님은', style: SafetyPassTextStyle.bodyEB17.copyWith(color: SafetPassColor.bk5)),
                const SizedBox(height: 2),
                Text('$capacity명을 수용 하는', style: SafetyPassTextStyle.bodyEB17),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.emoji_events_outlined, size: 18, color: Colors.black87),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(venue, style: SafetyPassTextStyle.bodySB17),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton(
                    onPressed: onTicketPressed,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF120E50),
                      side: const BorderSide(color: Color(0xFFBFD3E1)),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('내 티켓 정보'),
                        const SizedBox(width: 6),
                        const Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            height: 100,
            child: Image.asset(
              'assets/images/home-char.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickGrid extends StatelessWidget {
  const _QuickGrid({required this.items});
  final List<_QuickItem> items;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final itemW = (w - 20 * 2 - 12) / 2;

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: items
          .map((e) => SizedBox(
        width: itemW,
        height: 110,
        child: _QuickTile(item: e),
      ))
          .toList(),
    );
  }
}

class _QuickItem {
  const _QuickItem({required this.icon, required this.label, required this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback onTap;
}

class _QuickTile extends StatelessWidget {
  const _QuickTile({required this.item});
  final _QuickItem item;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: item.onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 10, offset: Offset(0, 6))],
            border: Border.all(color: const Color(0x11000000)),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 30, color: Colors.green[700]),
              const SizedBox(height: 12),
              Text(item.label, textAlign: TextAlign.center, style: SafetyPassTextStyle.bodyEB17.copyWith(color: const Color(0xFF120E50))),
            ],
          ),
        ),
      ),
    );
  }
}
