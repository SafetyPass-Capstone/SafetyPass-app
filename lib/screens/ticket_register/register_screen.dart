import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safetypass_app/widgets/atoms/texts/styles.dart';
import 'package:safetypass_app/constants/paths.dart';
import 'package:safetypass_app/constants/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  bool _isVenueSelected = false;
  String _selectedVenueName = '';
  String _selectedVenueCapacity = '';
  List<Map<String, String>> _filteredVenues = [];

  // 임시 행사장 데이터
  final List<Map<String, String>> _allVenues = [
    {'name': '올림픽공원 올림픽홀', 'capacity': '3000'},
    {'name': '서울 잠실 실내체육관', 'capacity': '15000'},
    {'name': '고척 스카이돔', 'capacity': '18000'},
  ];

  @override
  void initState() {
    super.initState();
    _filteredVenues = _allVenues;
  }

  void _filterVenues(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredVenues = _allVenues;
      } else {
        _filteredVenues = _allVenues
            .where((venue) =>
                venue['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        onTap: () {
                          if (context.canPop()) {
                            context.pop();
                          } else {
                            context.go(Paths.landing);
                          }
                        },
                        child: const Icon(Icons.arrow_back_ios_new_rounded, size: 28),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '행사장 등록',
                      style: SafetyPassTextStyle.titleSB24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '행사장을 검색하시거나 티켓을 스캔하세요',
                      style: SafetyPassTextStyle.bodyR15,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // QR 스캔 화면으로 이동
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _QrScanCard(onTap: () => context.push(Paths.scan)),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      '또는',
                      style: SafetyPassTextStyle.bodyR15,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                    controller: _searchCtrl,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      hintText: '행사장 장소 검색',
                      hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: SafetyPassColor.darkBlueAlt,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                      style: const TextStyle(color: Colors.white),
                      onChanged: _filterVenues,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '최근 검색',
                      style: SafetyPassTextStyle.bodyR12.copyWith(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 검색 결과 리스트
                  ..._filteredVenues.map((venue) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _VenueItem(
                        name: venue['name']!,
                        capacity: venue['capacity']!,
                        isSelected: _isVenueSelected &&
                            _selectedVenueName == venue['name'],
                        onTap: () {
                          setState(() {
                            if (_selectedVenueName == venue['name']) {
                              _isVenueSelected = false;
                              _selectedVenueName = '';
                              _selectedVenueCapacity = '';
                            } else {
                              _isVenueSelected = true;
                              _selectedVenueName = venue['name']!;
                              _selectedVenueCapacity = venue['capacity']!;
                            }
                          });
                        },
                      ),
                  )),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            if (_isVenueSelected)
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => context.push(Paths.venueComplete),
                    style: FilledButton.styleFrom(
                      backgroundColor: SafetyPassColor.darkBlue,
                      foregroundColor: SafetyPassColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: SafetyPassTextStyle.bodySB20,
                    ),
                    child: const Text('다음'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _VenueItem extends StatelessWidget {
  const _VenueItem({
    required this.name,
    required this.capacity,
    required this.onTap,
    this.isSelected = false,
  });

  final String name;
  final String capacity;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? SafetyPassColor.systemSkyblue : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? SafetyPassColor.darkBlueAlt : const Color(0x22000000),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: SafetyPassTextStyle.bodyEB17),
                    const SizedBox(height: 6),
                    Text('수용인원 : $capacity', style: SafetyPassTextStyle.bodyR12),
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
            const Icon(Icons.photo_camera_outlined, size: 32, color: SafetyPassColor.darkBlue),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('티켓 QR 스캔', style: SafetyPassTextStyle.bodyEB20),
                  const SizedBox(height: 6),
                  Text('좌석까지 한번에 등록하세요', style: SafetyPassTextStyle.bodyR12),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_rounded, size: 20, color: Color(0xFF74B8CA)),
          ],
        ),
      ),
    );
  }
}
