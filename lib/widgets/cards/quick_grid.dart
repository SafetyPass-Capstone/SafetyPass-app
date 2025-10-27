import 'package:flutter/material.dart';
import 'package:safetypass_app/widgets/atoms/texts/styles.dart';

class QuickItem {
  const QuickItem({required this.icon, required this.label});
  final IconData icon;
  final String label;
}

class QuickGrid extends StatelessWidget {
  const QuickGrid({super.key, required this.items});
  final List<QuickItem> items;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final itemW = (w - 20 * 2 - 12) / 2;

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: items
          .map((e) => SizedBox(
        width: itemW,
        height: 142,
        child: _QuickTile(item: e),
      ))
          .toList(),
    );
  }
}

class _QuickTile extends StatelessWidget {
  const _QuickTile({required this.item});
  final QuickItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(2, 2),
              spreadRadius: 0)
        ],
        border: Border.all(color: const Color(0xFFD8D8D8)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, size: 30, color: Colors.green[700]),
          const SizedBox(height: 12),
          Text(item.label,
              textAlign: TextAlign.center,
              style: SafetyPassTextStyle.bodyEB17
                  .copyWith(color: const Color(0xFF120E50))),
        ],
      ),
    );
  }
}
