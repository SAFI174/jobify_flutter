import 'package:get/get.dart';

import '../modules/ConfrimEmail/bindings/confrim_email_binding.dart';
import '../modules/ConfrimEmail/views/confrim_email_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profileData/bindings/profile_data_binding.dart';
import '../modules/profileData/views/profile_data_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../views/views/welcome_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomePageView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.CONFRIM_EMAIL,
      page: () => ConfrimEmailView(),
      binding: ConfrimEmailBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DATA,
      page: () => const ProfileDataView(),
      binding: ProfileDataBinding(),
    ),
  ];
}
