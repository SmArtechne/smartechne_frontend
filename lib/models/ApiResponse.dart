class ApiResponse {
  final int remainSeat;
  final List<int> result;
  final int humidity;
  final int temp;

  ApiResponse({
    required this.remainSeat,
    required this.result,
    required this.humidity,
    required this.temp,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      remainSeat: json['remain_seat'],
      result: List<int>.from(json['result']),
      humidity: json['humidity'],
      temp: json['temp'],
    );
  }
}
