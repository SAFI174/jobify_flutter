import 'package:get/get.dart';

import '../controllers/confrim_email_controller.dart';

class ConfrimEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfrimEmailController>(
      () => ConfrimEmailController(),
    );
  }
}
