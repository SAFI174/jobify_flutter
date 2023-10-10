import 'package:get/get.dart';
import 'package:jobify/app/data/enums/user_type.dart';
import 'package:jobify/app/data/models/user/freelancer.dart';
import 'package:jobify/app/data/models/user/project_manager.dart';
import 'package:jobify/app/data/models/user/user.dart';
import 'package:jobify/app/data/repo/user_repo.dart';
import 'package:jobify/app/data/services/user_cache_service.dart';

class ProfileDataController extends GetxController {
  final CacheService cacheService = Get.find<CacheService>();
  final UserRepository userRepository = UserRepository();
  final isDataLoaded = false.obs;
  final Rx<UserType> userType = Rx<UserType>(UserType.freelancer);
  Rx<User> user = Rx<User>(User());

  Future<void> loadUserData() async {
    isDataLoaded.value = false;
    userType.value == UserType.freelancer
        ? user.value = cacheService.getUser() as Freelancer
        : user.value = cacheService.getUser() as ProjectManager;
    isDataLoaded.value = true;
  }

  Future<void> refreshUserData() async {
    isDataLoaded.value = false;
    userType.value == UserType.freelancer
        ? user.value = await userRepository.getUserData() as Freelancer
        : user.value = await userRepository.getUserData() as ProjectManager;
    isDataLoaded.value = true;
  }

  @override
  void onInit() async {
    userType.value = await cacheService.getCurrentUserType() as UserType;
    await loadUserData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
