import 'package:dio/dio.dart';
import 'package:movie_app_db_iti_task/constans/strings/strings.dart';
import 'package:movie_app_db_iti_task/data_layer/models/models.dart';

class ApiServices {
  late Dio _dio;

  ApiServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
    );
    _dio = Dio(options);
  }

  Future fetchData() async {
    try {
      final Response res = await _dio.get(
          '/?api_key=837aa67b269303622a476bbe24283a57&fbclid=IwAR3_6fnMzKpAZY1wmmk-tCvzUh9Qr4_vQc-gkQwEKxXVDMGh0zzHcHUt_jE/results');
      print(res.data.toString());
      final movies = res.data['results'] as List;
      return movies;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
