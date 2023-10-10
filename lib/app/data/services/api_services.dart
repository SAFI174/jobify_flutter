import 'package:dio/dio.dart' as dio_package;
import 'package:get/get.dart';
import 'package:jobify/app/data/constants.dart';
import 'package:jobify/app/data/models/user/user.dart';
import 'package:jobify/app/data/services/user_cache_service.dart';

class ApiService extends GetxService {
  final dio_package.Dio dio = dio_package.Dio();
  final cacheService = Get.put(CacheService());

  // Define your API base URL here
  late final String autoToken;

  @override
  void onInit() async {
    autoToken = await cacheService.loadAuthTokenFromCache();
    await cacheService.getCurrentUserType();
    super.onInit();
  }

  Future<dio_package.Response> getData(String endpoint) async {
    try {
      final response = await dio.get(
        '$apiUrl/$endpoint',
        options: dio_package.Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $autoToken",
          },
        ),
      );
      return response;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<dio_package.Response> postData(
      String endpoint, Map<String, dynamic>? data) async {
    try {
      final response = await dio.post(
        '$apiUrl/$endpoint',
        data: data,
        options: dio_package.Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $autoToken",
          },
        ),
      );
      return response;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
