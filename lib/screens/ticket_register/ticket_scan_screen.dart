import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:safetypass_app/stores/event_store.dart';
import 'package:safetypass_app/models/event_models.dart';
import 'package:safetypass_app/constants/paths.dart';

import 'package:safetypass_app/widgets/atoms/texts/styles.dart';
import 'package:safetypass_app/constants/colors.dart';

class TicketScanScreen extends StatefulWidget {
  const TicketScanScreen({super.key});

  @override
  State<TicketScanScreen> createState() => _TicketScanScreenState();
}

class _TicketScanScreenState extends State<TicketScanScreen> {
  final MobileScannerController _controller = MobileScannerController(
    facing: CameraFacing.back,
    torchEnabled: false,
    formats: const [BarcodeFormat.qrCode],
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  bool _handled = false;
  static const String _payload = 'T34902943123';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _toCheckingThenPreview() async {
    context.push(Paths.ticketChecking);
    // !!QR 스캔 시간 바꾸려면 여기서 바꾸세요!!
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    context.go(Paths.ticketPreview);
  }

  void _applyTicketFromPayload(String raw) {
    if (raw.trim() != _payload) return;
    const info = TicketInfo(
      eventTitle: "[Play & Stay] 2025 ILLIT GLITTER DAY IN SEOUL+ Hotels",
      place: "올림픽공원 올림픽홀",
      date: "2025.06.12",
      seat: "2A1_4",
      zone: "I자형",
      owner: "장민영",
    );
    context.read<EventStore>().setTicket(info);
  }

  void _handle(String raw) {
    if (_handled) return;
    _handled = true;
    HapticFeedback.lightImpact();
    _applyTicketFromPayload(raw);
    _toCheckingThenPreview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SafetyPassColor.white,
      appBar: AppBar(
        title: Text('티켓 QR 스캔', style: SafetyPassTextStyle.titleSB24),
        backgroundColor: SafetyPassColor.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            tooltip: '플래시',
            onPressed: () => _controller.toggleTorch(),
            icon: const Icon(Icons.flash_on_outlined),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _controller,
            fit: BoxFit.cover,
            onDetect: (capture) {
              if (_handled || capture.barcodes.isEmpty) return;
              final raw = capture.barcodes.first.rawValue;
              if (raw != null && raw.isNotEmpty) _handle(raw);
            },
            errorBuilder: (context, error, child) =>
                Center(child: Text('카메라 오류: $error')),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'QR을 가운데에 맞춰주세요',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
