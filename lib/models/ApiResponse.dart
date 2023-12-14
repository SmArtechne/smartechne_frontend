class ApiResponse {
  final int remainSeat;
  final List<int> result;

  ApiResponse({
    required this.remainSeat,
    required this.result,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      remainSeat: json['remain_seat'],
      result: List<int>.from(json['result']),
    );
  }
}
