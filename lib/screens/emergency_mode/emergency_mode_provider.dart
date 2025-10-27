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

  EmergencyModeProvider() {
    getEvacuationInfo();
  }

  Future<void> getEvacuationInfo() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final response = await _frontedEmergencyService.getEvacuationInfo(seat);
      evacuationInfo = response;

      if (response.isEmergency) {
        log('긴급 상황! 최적 출구: ${response.optimalExit}');
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

  // 좌석 변경
  void updateSeat(String newSeat) {
    seat = newSeat;
    getEvacuationInfo();
  }
}
