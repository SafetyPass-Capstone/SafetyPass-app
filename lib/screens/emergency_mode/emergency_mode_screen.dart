import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:safetypass_app/constants/colors.dart';
import 'package:safetypass_app/screens/emergency_mode/emergency_mode_provider.dart';
import 'package:safetypass_app/widgets/atoms/texts/styles.dart';
import 'package:safetypass_app/widgets/atoms/texts/texts.dart';
import 'package:safetypass_app/widgets/emergency_button.dart';
import 'package:safetypass_app/widgets/organisms/stadium_map_widget.dart';

class EmergencyModeScreen extends StatefulWidget {
  const EmergencyModeScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyModeScreen> createState() => _EmergencyModeScreenState();
}

class _EmergencyModeScreenState extends State<EmergencyModeScreen> {
  bool is2DMode = true; // 2D/3D 토글

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EmergencyModeProvider(),
      child: Scaffold(
        backgroundColor: SafetyPassColor.systemGray05,
        body: SafeArea(
          child: Consumer<EmergencyModeProvider>(
            builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // 상단 제목
                      EmergencyButton(
                        text: '긴급 대피 모드',
                        isOn: true,
                        onTap: () {
                          Provider.of<EmergencyModeProvider>(context,
                                  listen: false)
                              .dispose();
                          context.pop();
                        },
                      ),
                      const SizedBox(height: 20),

                      // 2D/3D 탭 버튼
                      _build2D3DToggle(),
                      const SizedBox(height: 20),

                      // 좌석 맵
                      _buildStadiumMapContainer(provider),
                      const SizedBox(height: 20),

                      // 최적 탈출구 탐색 버튼
                      provider.isMonitoring
                          ? _buildEvacuationInfoBox(provider)
                          : _buildSearchButton(provider),
                      const SizedBox(height: 20),

                      // 내 좌석 & 예상 대피시간 정보
                      _buildInfoBoxes(provider),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // 2D/3D 토글 버튼
  Widget _build2D3DToggle() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF000000),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFFFFFFF),
          width: 0.2,
        ),
      ),
      child: Row(
        children: [
          // 2D 버튼
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    is2DMode = true;
                  });
                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color:
                        is2DMode ? const Color(0xFF253248) : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '2D',
                    style: SafetyPassTextStyle.bodyEB17
                        .copyWith(color: SafetyPassColor.white),
                  ),
                ),
              ),
            ),
          ),

          // 3D 버튼
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    is2DMode = false;
                  });
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: !is2DMode
                        ? const Color(0xFF2D4A6F)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '3D',
                    style: SafetyPassTextStyle.bodyEB17
                        .copyWith(color: SafetyPassColor.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 경기장 맵 컨테이너
  Widget _buildStadiumMapContainer(EmergencyModeProvider provider) {
    return Container(
      height: 270,
      decoration: BoxDecoration(
        color: SafetyPassColor.systemGray05,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFFFFFFF),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: StadiumMapWidget(
          evacuationPath: provider.evacuationPath, // 대피 경로 전달
          closedExits:
              provider.evacuationInfo?.closedExits ?? const [], // 폐쇠 출구 전달
          fireLocation: provider.evacuationInfo?.fireLocation, // 화제 위치 전달
        ),
      ),
    );
  }

  // 최적 탈출구 탐색 버튼
  Widget _buildSearchButton(EmergencyModeProvider provider) {
    return GestureDetector(
      onTap: () {
        provider.toggleMonitoring();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: SafetyPassColor.green,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: const Text(
          '최적 탈출구 탐색',
          style: SafetyPassTextStyle.bodyEB30,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // 대피 정보 박스
  Widget _buildEvacuationInfoBox(EmergencyModeProvider provider) {
    final info = provider.evacuationInfo;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 최적 탈출구 알림 박스
        Container(
          width: 350,
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: SafetyPassColor.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '최적 탈출구',
            style: SafetyPassTextStyle.bodyEB17
                .copyWith(color: SafetyPassColor.systemGray05),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: 10),

        // 탈출구
        Container(
          width: 350,
          height: 90,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: SafetyPassColor.systemGray05,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: SafetyPassColor.white,
              width: 1,
            ),
          ),
          child: Text(
            info?.optimalExit ?? '최적 탈출구',
            style: SafetyPassTextStyle.bodyEB50
                .copyWith(color: SafetyPassColor.green),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  // 내 좌석 & 예상 대피시간 정보 박스
  Widget _buildInfoBoxes(EmergencyModeProvider provider) {
    final info = provider.evacuationInfo;

    return Row(
      children: [
        // 내 좌석
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: SafetyPassColor.systemGray05,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: SafetyPassColor.white,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Text('내 좌석',
                    style: SafetyPassTextStyle.bodyEB17
                        .copyWith(color: SafetyPassColor.white)),
                const SizedBox(height: 5),
                Text(provider.seat,
                    style: SafetyPassTextStyle.bodyEB30
                        .copyWith(color: SafetyPassColor.white)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),

        // 예상 대피시간
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: SafetyPassColor.systemGray05,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: SafetyPassColor.white,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Text('예상 대피시간',
                    style: SafetyPassTextStyle.bodyEB17
                        .copyWith(color: SafetyPassColor.white)),
                const SizedBox(height: 5),
                Text(
                  info?.estimatedTime ?? '-',
                  style: SafetyPassTextStyle.bodyEB30
                      .copyWith(color: SafetyPassColor.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
