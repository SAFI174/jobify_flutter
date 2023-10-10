import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobify/app/data/enums/gender.dart';
import 'package:jobify/app/data/enums/user_type.dart';
import 'package:jobify/app/routes/app_pages.dart';
import 'package:jobify/app/widgets/custom_password_field.dart';
import 'package:jobify/app/widgets/custom_text_from_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/signup_controller.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(scrolledUnderElevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 90.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Create account",
                            style: theme.textTheme.headlineMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(() {
                            return Text(
                              controller.responseMessage.value,
                              style: theme.textTheme.labelLarge!
                                  .copyWith(color: theme.colorScheme.error),
                            );
                          }),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  Flexible(
                                    child: CustomTextFormField(
                                      label: "First Name",
                                      controller:
                                          controller.firstNameController,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: CustomTextFormField(
                                      label: "Last Name",
                                      controller: controller.lastNameController,
                                    ),
                                  ),
                                ],
                              ),
                              CustomTextFormField(
                                label: "Email",
                                controller: controller.emailController,
                              ),
                              CustomTextFormField(
                                label: "Phone Number",
                                controller: controller.phoneNumberController,
                              ),
                              CustomTextFormField(
                                label: "Username",
                                controller: controller.userNameController,
                              ),
                              CustomPasswordField(
                                controller: controller.passwordController,
                              ),
                              SizedBox(
                                width: 90.w,
                                child: Obx(() {
                                  return MaterialSegmentedControl(
                                    selectionIndex: controller.selectedGender
                                        .value, // Access the value directly
                                    horizontalPadding: EdgeInsets.zero,
                                    borderColor: theme.hintColor,
                                    selectedTextStyle: TextStyle(
                                        color:
                                            theme.colorScheme.onSurfaceVariant),
                                    selectedColor: theme.secondaryHeaderColor,
                                    unselectedColor: Colors.white,
                                    unselectedTextStyle: TextStyle(
                                        color:
                                            theme.colorScheme.onSurfaceVariant),
                                    onSegmentTapped: (index) {
                                      controller.selectedGender.value =
                                          index; // Update the value directly
                                    },
                                    children: genderMap,
                                  );
                                }),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: 90.w,
                                child: Obx(() {
                                  return MaterialSegmentedControl(
                                    selectionIndex: controller.selectedUserType
                                        .value, // Access the value directly
                                    horizontalPadding: EdgeInsets.zero,
                                    borderColor: theme.hintColor,
                                    selectedTextStyle: TextStyle(
                                        color:
                                            theme.colorScheme.onSurfaceVariant),
                                    selectedColor: theme.secondaryHeaderColor,
                                    unselectedColor: Colors.white,
                                    unselectedTextStyle: TextStyle(
                                        color:
                                            theme.colorScheme.onSurfaceVariant),
                                    onSegmentTapped: (index) {
                                      controller.selectedUserType.value =
                                          index; // Update the value directly
                                    },
                                    children: userTypeMap,
                                  );
                                }),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(() {
                                return FilledButton(
                                  style: FilledButton.styleFrom(
                                      elevation: 5,
                                      minimumSize: Size(80.w, 50)),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      controller.createAccount();
                                    }
                                  },
                                  child: controller.isLoading.value
                                      ? CircularProgressIndicator(
                                          color: theme.colorScheme.background,
                                          strokeWidth: 2,
                                        )
                                      : const Text(
                                          "Create Account",
                                        ),
                                );
                              }),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text("Already have account? "),
                                  GestureDetector(
                                    onTap: () {
                                      Get.offNamed(Routes.LOGIN);
                                    },
                                    child: Text(
                                      "Login",
                                      style: theme.textTheme.labelMedium!
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
