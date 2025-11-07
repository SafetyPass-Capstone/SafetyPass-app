import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:safetypass_app/widgets/atoms/texts/styles.dart';
import 'package:safetypass_app/constants/paths.dart';
import 'package:safetypass_app/stores/event_store.dart';
import 'package:safetypass_app/models/event_models.dart';

import '../../constants/colors.dart';

class TicketInputScreen extends StatefulWidget {
  const TicketInputScreen({super.key});

  @override
  State<TicketInputScreen> createState() => _TicketInputScreenState();
}

class _TicketInputScreenState extends State<TicketInputScreen> {
  final TextEditingController _eventNameCtrl = TextEditingController();
  final TextEditingController _dateCtrl = TextEditingController();
  final TextEditingController _bookerNameCtrl = TextEditingController();
  final TextEditingController _seatCtrl = TextEditingController();

  bool get _isFormValid {
    return _eventNameCtrl.text.isNotEmpty &&
        _dateCtrl.text.isNotEmpty &&
        _bookerNameCtrl.text.isNotEmpty &&
        _seatCtrl.text.isNotEmpty;
  }

  @override
  void dispose() {
    _eventNameCtrl.dispose();
    _dateCtrl.dispose();
    _bookerNameCtrl.dispose();
    _seatCtrl.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: SafetyPassColor.darkBlue,
              onPrimary: SafetyPassColor.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _dateCtrl.text = '${picked.year}.${picked.month.toString().padLeft(2, '0')}.${picked.day.toString().padLeft(2, '0')}.';
      });
    }
  }

  Future<void> _toCheckingThenPreview() async {
    // 입력한 티켓 정보를 저장
    final ticketInfo = TicketInfo(
      eventTitle: _eventNameCtrl.text,
      place: "올림픽공원 올림픽홀",
      date: _dateCtrl.text,
      seat: _seatCtrl.text,
      zone: "I자형", // 임시로 I자형 설정
      owner: _bookerNameCtrl.text,
    );
    context.read<EventStore>().setTicket(ticketInfo);

    // 티켓 확인 화면으로 이동
    context.push(Paths.ticketChecking);
    
    // 2초 후 티켓 미리보기 화면으로 이동
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    context.go(Paths.ticketPreview);
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 8, bottom: 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints.tightFor(width: 40, height: 40),
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        onPressed: () => context.pop(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '티켓(좌석) 정보 입력',
                    style: SafetyPassTextStyle.titleSB24.copyWith(
                      color: SafetyPassColor.darkBlueAlt,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 올림픽공원 올림픽홀 표시
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.02, 0.29),
                        end: Alignment(1.00, 0.73),
                        colors: [Color(0xFFD8FCE9), Color(0xFFCFF5F9)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFF1F1F1),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      '올림픽공원 올림픽홀',
                      style: SafetyPassTextStyle.bodySB20.copyWith(
                        color: SafetyPassColor.greenDark,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // 행사명 입력
                  _buildLabelWithRequired('행사명'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: _eventNameCtrl,
                    suffixText: '검색',
                  ),
                  const SizedBox(height: 24),
                  // 날짜 입력
                  _buildLabelWithRequired('날짜'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: _dateCtrl,
                    hintText: '연도.월.일.',
                    suffixIcon: Icons.calendar_month,
                    readOnly: true,
                    onTap: _selectDate,
                  ),
                  const SizedBox(height: 24),
                  // 예매자명 입력
                  _buildLabelWithRequired('예매자명'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: _bookerNameCtrl,
                  ),
                  const SizedBox(height: 24),
                  // 좌석 정보 입력
                  _buildLabelWithRequired('좌석 정보'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller: _seatCtrl,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: FilledButton(
                  onPressed: _isFormValid ? _toCheckingThenPreview : null,
                  style: FilledButton.styleFrom(
                    backgroundColor: _isFormValid
                        ? SafetyPassColor.darkBlue
                        : const Color(0xFFC2C2C2),
                    foregroundColor: SafetyPassColor.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: SafetyPassTextStyle.bodySB20,
                  ),
                  child: const Text('티켓(좌석) 등록'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelWithRequired(String label) {
    return Row(
      children: [
        Text(
          label,
          style: SafetyPassTextStyle.bodyEB17.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          '*',
          style: SafetyPassTextStyle.bodyEB17.copyWith(
            color: const Color(0xFFFE7979),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    String? hintText,
    String? suffixText,
    IconData? suffixIcon,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF9C9C9C),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: SafetyPassTextStyle.bodyEB17.copyWith(
            color: const Color(0xFFAFAFAF),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          suffixText: suffixText,
          suffixStyle: SafetyPassTextStyle.bodyEB17.copyWith(
            color: Colors.black,
          ),
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  color: Colors.black,
                  size: 24,
                )
              : null,
        ),
        style: SafetyPassTextStyle.bodyEB17,
        onChanged: (_) => setState(() {}),
      ),
    );
  }
}

