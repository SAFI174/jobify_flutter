import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:jobify/app/routes/app_pages.dart';
import 'package:jobify/app/widgets/custom_password_field.dart';
import 'package:jobify/app/widgets/custom_text_from_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: 80.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Login",
                          style: theme.textTheme.headlineMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Login to your account",
                          style: theme.textTheme.labelMedium!
                              .copyWith(color: theme.hintColor),
                        ),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Obx(() {
                            return Text(
                              controller.responseMessage.value,
                              style: theme.textTheme.labelLarge!.copyWith(
                                color: theme.colorScheme.error,
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            label: "Email or Username",
                            controller: controller.userNameController,
                          ),
                          CustomPasswordField(
                            enableValidate: false,
                            controller: controller.passwordController,
                          ),
                          Obx(() {
                            return FilledButton(
                              style: FilledButton.styleFrom(
                                  elevation: 5, minimumSize: Size(80.w, 50)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.login();
                                }
                              },
                              child: controller.isLoading.value
                                  ? CircularProgressIndicator(
                                      color: theme.colorScheme.background,
                                      strokeWidth: 2,
                                    )
                                  : const Text(
                                      "Login",
                                    ),
                            );
                          }),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed(Routes.SIGNUP);
                          },
                          child: Text(
                            "Create Account",
                            style: theme.textTheme.labelMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                      child: SvgPicture.asset('assets/svg/login.svg'),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
