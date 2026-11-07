import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );
}
