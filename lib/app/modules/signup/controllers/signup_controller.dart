import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobify/app/data/repo/user_repo.dart';
import 'package:jobify/app/routes/app_pages.dart';

class SignupController extends GetxController {
  final responseMessage = ''.obs;
  final isLoading = false.obs;

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController userNameController;
  late final TextEditingController passwordController;

  final RxInt selectedGender = 0.obs;
  final RxInt selectedUserType = 1.obs;

  void createAccount() async {
    isLoading.value = true;
    final userRepo = UserRepository();
    responseMessage.value = await userRepo.createAccount(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        username: userNameController.text,
        password: passwordController.text,
        userType: selectedUserType.value,
        gender: selectedGender.value);
    isLoading.value = false;
    if (responseMessage.value.isEmpty) {
      Get.offNamed(Routes.CONFRIM_EMAIL, arguments: emailController.text);
    }
  }

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
