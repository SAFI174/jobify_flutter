import 'package:get/get.dart';

import '../controllers/profile_data_controller.dart';

class ProfileDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileDataController>(
      () => ProfileDataController(),
    );
  }
}
