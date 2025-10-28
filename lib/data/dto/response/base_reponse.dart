class BaseResponse<T> {
  final String status;
  final T data;

  BaseResponse({
    required this.status,
    required this.data,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return BaseResponse(
      status: json['status'] as String,
      data: fromJsonT(json['data']),
    );
  }
}
