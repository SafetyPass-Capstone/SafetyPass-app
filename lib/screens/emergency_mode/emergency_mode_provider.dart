import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:safetypass_app/data/service/fronted_emergency_service.dart';
import 'package:safetypass_app/data/dto/response/evacuation_info/evacuation_info_response.dart';

class EmergencyModeProvider extends ChangeNotifier {
  final FrontedEmergencyService _frontedEmergencyService =
      FrontedEmergencyService();

  // 상태 변수들
  String seat = '2E3_2';
  EvacuationInfoResponse? evacuationInfo;
  bool isLoading = false;
  String? errorMessage;

  // 실시간 모니터링 상태
  bool isMonitoring = false;
  Timer? _monitoringTimer;
  StreamSubscription? _streamSubscription;

  // 대피 경로
  List<String> get evacuationPath => evacuationInfo?.evacuationPath ?? [];

  EmergencyModeProvider() {
    // 초기 데이터 로드
    getEvacuationInfo();
  }

  @override
  void dispose() {
    _monitoringTimer?.cancel(); // Timer 중지
    _streamSubscription?.cancel(); // Stream 구독 중지
    super.dispose();
  }

  // 일반 API 호출 (한 번만)
  Future<void> getEvacuationInfo() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final response = await _frontedEmergencyService.getEvacuationInfo(seat);
      evacuationInfo = response;

      if (response.isEmergency) {
        log('긴급 상황!');
      } else {
        log('일반 상황: ${response.message}');
      }
    } catch (e) {
      errorMessage = e.toString();
      log('Error get evacuation info detail: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // 실시간 모니터링 시작
  void startMonitoring() {
    if (isMonitoring) return; // 이미 실행 중이면 무시

    isMonitoring = true;
    notifyListeners();

    log('실시간 모니터링 시작');

    // Timer.periodic
    _monitoringTimer = Timer.periodic(Duration(seconds: 1), (timer) async {
      await _fetchRealtimeData();
    });

    // 첫 번째 데이터 즉시 가져오기
    _fetchRealtimeData();
  }

  // 모니터링 토글
  void toggleMonitoring() {
    startMonitoring();
  }

  // 실시간 데이터 가져오기
  Future<void> _fetchRealtimeData() async {
    try {
      final response = await _frontedEmergencyService.getEvacuationInfo(seat);
      evacuationInfo = response;

      if (response.isEmergency) {
        log('⚠️ [${DateTime.now().toString().substring(11, 19)}] 긴급! 출구: ${response.optimalExit}');
      } else {
        log('✅ [${DateTime.now().toString().substring(11, 19)}] 안전: ${response.message}');
      }

      notifyListeners();
    } catch (e) {
      log('❌ [${DateTime.now().toString().substring(11, 19)}] 에러: $e');
      // 에러가 나도 모니터링은 계속 (네트워크 일시 오류 대비)
    }
  }

  // 좌석 변경
  void updateSeat(String newSeat) {
    seat = newSeat;

    // 모니터링 중이면 재시작
    if (isMonitoring) {
      startMonitoring();
    } else {
      getEvacuationInfo();
    }
  }
}
