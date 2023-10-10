import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobify/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomePageView extends GetView {
  const WelcomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(
                      text: 'Welcome to ',
                      children: [
                        TextSpan(
                          text: 'JOB',
                          style: GoogleFonts.raleway(
                              color: theme.colorScheme.onBackground,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'IFY',
                          style: GoogleFonts.raleway(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                      style: theme.textTheme.headlineLarge!.copyWith(),
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
              const Text(
                'Your gateway to a world of opportunities.',
                textScaleFactor: 0.8,
              ),
              Container(
                height: 50.h,
                width: 100.w,
                padding: const EdgeInsets.all(30),
                child: SvgPicture.asset(
                  'assets/svg/welcome.svg',
                ),
              ),
              SizedBox(
                width: 80.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton(
                      style:
                          OutlinedButton.styleFrom(minimumSize: Size(80.w, 50)),
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                      child: const Text(
                        "Login",
                      ),
                    ),
                    const SizedBox(height: 10),
                    FilledButton(
                      style: FilledButton.styleFrom(
                          elevation: 5, minimumSize: Size(80.w, 50)),
                      onPressed: () => Get.toNamed(Routes.SIGNUP),
                      child: const Text(
                        "Create Account",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Continue as Guest?',
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onBackground,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
