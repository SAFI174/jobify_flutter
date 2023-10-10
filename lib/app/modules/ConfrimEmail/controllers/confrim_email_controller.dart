import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobify/app/data/repo/user_repo.dart';
import 'package:jobify/app/data/services/user_cache_service.dart';
import 'package:jobify/app/helpers/toast_helper.dart';
import 'package:jobify/app/routes/app_pages.dart';

class ConfrimEmailController extends GetxController {
  late final UserRepository userRepository;
  late final CacheService cacheService;

  final responseMessage = ''.obs;
  final isLoading = false.obs;

  late final String email;
  late final TextEditingController codeController;

  void confirmEmail() async {
    isLoading.value = true;
    responseMessage.value =
        await userRepository.confirmEmail(code: codeController.text);
    isLoading.value = false;
    if (responseMessage.value == '') {
      final user = await cacheService.getUser();
      showToast(msg: 'Welcome ${user!.firstname}');
      await Get.offAllNamed(Routes.HOME);
    }
  }

  void sendCode() async {
    await userRepository.sendConfirmationCodeEmail(email: email);
    showToast(msg: 'The code is sent successfully');
  }

  @override
  void onInit() {
    cacheService = Get.find<CacheService>();
    codeController = TextEditingController();
    userRepository = UserRepository();
    email = Get.arguments;
    sendCode();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    codeController.dispose();
    super.onClose();
  }
}
