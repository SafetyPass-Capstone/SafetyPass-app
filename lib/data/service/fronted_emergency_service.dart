import 'package:dio/dio.dart';
import 'package:safetypass_app/constants/apis.dart';
import 'package:safetypass_app/data/di/api_client.dart';
import 'package:safetypass_app/data/dto/response/evacuation_info/evacuation_info_response.dart';

class FrontedEmergencyService {
  final ApiClient _apiClient = ApiClient();
  static const apiType = "api/frontend/";

  /// 특정 좌석의 대피 정보 조회 sidebar.py의 render_evacuation_path_selector()와 동일한 계산 방식 사용
  Future<EvacuationInfoResponse> getEvacuationInfo(String seat) async {
    try {
      final response = await _apiClient.dio.get(
        '$apiType${Apis.getEvacuationInfo}/$seat',
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('data') &&
            responseData['data'] is Map<String, dynamic>) {
          final content = responseData['data'] as Map<String, dynamic>;
          return EvacuationInfoResponse.fromJson(content);
        } else {
          throw Exception('Unexpected response format: $responseData');
        }
      } else {
        throw Exception('Failed to fetch COGO details: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception('Error: ${e.response?.data ?? e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
