import 'dart:core';

abstract class Apis {
  Apis._();

  /// 변수명은 동사+목적어로 명명한다.
  /// baseUrl 끝에 /가 있어서, 여기서는 맨 앞에 /을 빼고 기입한다.

  /// 특정 좌석의 대피 정보 조회 api
  static const String getEvacuationInfo = "getEvacuationInfo/";
}
