import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio = Dio();
  String baseurl = 'https://api.weatherapi.com/v1/';
  String endpoint = 'forecast.json';
  String apiKey = '346b70b0f76f413dbef151751242407';

  WeatherServices(Dio dio);
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      final Response response = await dio.get(baseurl + endpoint,
          queryParameters: {'key': apiKey, 'days': 7, 'q': cityName});
      dynamic json = response.data;
      return WeatherModel.fromJson(json);
    } on DioException catch (e) {
      final String errorMassage =
          e.response?.data['error']['message'] ?? 'oops! something went wrong ';
      //! -->sure 100% can't be null
      //? --> response is null don't access .data['error']['message']
      throw Exception(errorMassage);
    }
  }
}
