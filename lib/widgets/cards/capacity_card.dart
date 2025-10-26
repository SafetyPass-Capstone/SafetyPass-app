// lib/widgets/cards/capacity_card.dart
import 'package:flutter/material.dart';
import 'package:safetypass_app/widgets/atoms/texts/styles.dart';

class CapacityCard extends StatelessWidget {
  const CapacityCard({
    super.key,
    required this.name,
    required this.capacity,
    required this.venue,
  });

  final String name;
  final String capacity;
  final String venue;

  @override
  Widget build(BuildContext context) {
    const cardTextColor = Color(0xFF1A0A49);

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEAF7F2), Color(0xFFEAF4FB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
              color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 6))
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('현재 $name님은',
                    style: SafetyPassTextStyle.bodyEB17
                        .copyWith(color: cardTextColor)),
                const SizedBox(height: 2),
                Text('$capacity명을 수용 하는',
                    style: SafetyPassTextStyle.bodyEB17
                        .copyWith(color: cardTextColor)),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            size: 18, color: Colors.grey[700]),
                        const SizedBox(width: 6),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              venue,
                              style: SafetyPassTextStyle.bodyEB17
                                  .copyWith(color: const Color(0xFF034500)),
                            ),
                          ),
                        ),
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