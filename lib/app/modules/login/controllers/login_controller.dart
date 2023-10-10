import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobify/app/data/repo/user_repo.dart';
import 'package:jobify/app/data/services/user_cache_service.dart';
import 'package:jobify/app/helpers/toast_helper.dart';
import 'package:jobify/app/routes/app_pages.dart';

class LoginController extends GetxController {
  late final UserRepository userRepo;
  final CacheService cacheService = Get.find<CacheService>();

  final RxBool isLoading = false.obs;

  late final TextEditingController userNameController;

  late final TextEditingController passwordController;

  final responseMessage = ''.obs;

  void login() async {
    isLoading.value = true;

    responseMessage.value =
        await userRepo.login(userNameController.text, passwordController.text);
    isLoading.value = false;

    final user = cacheService.getUser();
    if (!user!.isconfirmedEmail! && responseMessage.value.isEmpty) {
      Get.toNamed(Routes.CONFRIM_EMAIL, arguments: user.email);
      showToast(msg: 'Your email is not been confirmed yet');
    }
    if (responseMessage.value.isEmpty && user.isconfirmedEmail!) {
      Get.offAllNamed(Routes.HOME);
      showToast(msg: 'Welcome ${user.firstname}');
    }
  }

  @override
  void onInit() {
    userRepo = UserRepository();

    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
