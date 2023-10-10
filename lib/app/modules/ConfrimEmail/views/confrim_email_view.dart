import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:jobify/app/widgets/custom_text_from_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/confrim_email_controller.dart';

class ConfrimEmailView extends GetView<ConfrimEmailController> {
  ConfrimEmailView({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(scrolledUnderElevation: 0),
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
                          "Confirm Your Account",
                          style: theme.textTheme.headlineMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "An Email has sent to:\n${controller.email}",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.labelMedium!.copyWith(
                            color: theme.hintColor,
                          ),
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
                            textAlign: TextAlign.center,
                            maxLength: 5,
                            label: "Code",
                            controller: controller.codeController,
                          ),
                          Obx(() {
                            return FilledButton(
                              style: FilledButton.styleFrom(
                                  elevation: 5, minimumSize: Size(80.w, 50)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.confirmEmail();
                                }
                              },
                              child: controller.isLoading.value
                                  ? CircularProgressIndicator(
                                      color: theme.colorScheme.background,
                                      strokeWidth: 2,
                                    )
                                  : const Text(
                                      "Verify",
                                    ),
                            );
                          }),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't receive code? "),
                        GestureDetector(
                          onTap: () {
                            controller.sendCode();
                          },
                          child: Text(
                            "Resend",
                            style: theme.textTheme.labelMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                      child: SvgPicture.asset('assets/svg/email_confirm.svg'),
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
