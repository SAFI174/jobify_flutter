import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobify/app/data/services/api_services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'app/routes/app_pages.dart';

void main() async {
  Get.put(ApiService());
  var initPage = Routes.WELCOME;
  // final userToken = await cacheSerivce.loadAuthTokenFromCache();
  // final user = await cacheSerivce.getUser()?.userName;
  // if (!userToken.isEmpty && user != null) {
  //   initPage = Routes.HOME;
  // } else {
  //   initPage = Routes.WELCOME;
  // }
  runApp(
    ResponsiveSizer(
      builder: (p0, p1, p2) {
        return GetMaterialApp(
          theme: FlexThemeData.light(
            colors: const FlexSchemeColor(
              primary: Color(0xff0fa517),
              primaryContainer: Color(0xff9ee29f),
              secondary: Color(0xff365b37),
              secondaryContainer: Color(0xffaebdaf),
              tertiary: Color(0xff2c7e2e),
              tertiaryContainer: Color(0xffb8e6b9),
              appBarColor: Color(0xffaebdaf),
              error: Color(0xffb00020),
            ),
            usedColors: 4,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 10,
              blendOnColors: false,
              useTextTheme: true,
              useM2StyleDividerInM3: true,
              alignedDropdown: true,
              useInputDecoratorThemeInDialogs: true,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            useMaterial3: true,
            swapLegacyOnMaterial3: true,
            onBackground: const Color(0XFF35434e),
            fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          title: "Application",
          initialRoute: initPage,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
