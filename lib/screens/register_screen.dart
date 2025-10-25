import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _searchCtrl = TextEditingController();

  // 임시 최근 검색 데이터
  static const String recentVenueName = '서울숲 공연홀';
  static const String recentVenueCapacity = '2500';

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('행사장 등록'),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: [
          Text(
            '행사장을 검색하시거나 티켓을 스캔하세요',
            style: text.bodyMedium?.copyWith(
                color: Colors.black87,
                height: 1.25,
            ),
          ),
          const SizedBox(height: 12),

          // TODO: QR 스캔 연결
          _QrScanCard(onTap: () {/* TODO: 나중에 QR 스캔 연결 */}),
          const SizedBox(height: 50),

          TextField(
            controller: _searchCtrl,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              hintText: '행사장 장소 검색',
              hintStyle: const TextStyle(color: Colors.white),
              filled: true,
              fillColor: const Color(0xFF120E50),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            style: const TextStyle(color: Colors.white),
            onChanged: (_) {},
          ),
          const SizedBox(height: 18),

          // 최근 검색은 동작 X
          Text('최근 검색', style: text.titleSmall?.copyWith(color: Colors.black54)),
          const SizedBox(height: 8),

          _VenueItem(
            name: recentVenueName,
            capacity: recentVenueCapacity,
            onTap: () {},
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _VenueItem extends StatelessWidget {
  const _VenueItem({
    required this.name,
    required this.capacity,
    required this.onTap,
  });

  final String name;
  final String capacity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0x22000000)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: text.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF120E50),
                        )),
                    const SizedBox(height: 6),
                    Text('수용인원 : $capacity',
                        style: text.bodyMedium?.copyWith(color: Colors.black54)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QrScanCard extends StatelessWidget {
  const _QrScanCard({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFEAF7F2), Color(0xFFEAF4FB)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            const Icon(Icons.photo_camera_outlined,
                size: 32, color: Color(0xFF120E50)),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('티켓 QR 스캔',
                      style: text.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF120E50),
                      )),
                  const SizedBox(height: 6),
                  Text('좌석까지 한번에 등록하세요',
                      style: text.bodyMedium?.copyWith(
                          color: Colors.black54, height: 1.2)),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_rounded,
                size: 20, color: Color(0xFF74B8CA)),
          ],
        ),
      ),
    );
  }
}
