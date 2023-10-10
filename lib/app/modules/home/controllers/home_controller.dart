import 'package:get/get.dart';
import 'package:jobify/app/data/services/user_cache_service.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() async {
    final cacheService = CacheService();
    final user = await cacheService.getUser();
    print("${user!.bio}+=========");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
