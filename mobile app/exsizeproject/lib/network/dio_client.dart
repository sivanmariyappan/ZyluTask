import 'package:dio/dio.dart';
import 'package:exsizeproject/common/constant/app_constant.dart';

class DioClient {

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstant.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );


  Future<Response> get(
    String url,
  ) async {
    return await dio.get(
     url
    );
  }

}