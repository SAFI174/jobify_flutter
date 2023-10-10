import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jobify/app/data/enums/user_type.dart';
import 'package:jobify/app/data/models/user/freelancer.dart';
import 'dart:convert';
import 'package:jobify/app/data/models/user/project_manager.dart';
import 'package:jobify/app/data/models/user/user.dart';

class CacheService<T extends User> extends GetxService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  final Rx<T?> user = Rx<T?>(null); // Reactive variable for user data

  final RxString authToken =
      ''.obs; // Reactive variable for authentication token

  static const String _userCacheKey = 'user'; // Key for user data in storage

  static const String _authTokenKey =
      'auth_token'; // Key for authentication token in storage

  static const String userTypeKey = 'user_type'; // Key for user type in storage

  // Save the user type to storage
  Future<void> saveUserType(int userType) async {
    await _secureStorage.write(key: userTypeKey, value: userType.toString());
  }

  // Retrieve the current user type from storage
  Future<UserType?> getCurrentUserType() async {
    // Retrieve the user type as a string from storage
    final userTypeStr = await _secureStorage.read(key: userTypeKey);

    // Convert the string to a UserType enum
    return userTypeStr != null
        ? UserType.values[int.tryParse(userTypeStr)!]
        : null;
  }

  // Save the authentication token to storage
  Future<void> saveAuthToken(String token) async {
    await _secureStorage.write(key: _authTokenKey, value: token);
    authToken.value = token;
  }

  // Load the authentication token from storage
  Future<String> loadAuthTokenFromCache() async {
    final token = await _secureStorage.read(key: _authTokenKey);
    if (token != null) {
      return authToken.value = token;
    } else {
      return '';
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await _loadUserFromCache(); // Load user data from storage when the service is initialized
  }

  // Save user data to storage
  Future<void> saveUser(T user) async {
    this.user.value = user;
    final userJson = jsonEncode(user.toJson());
    await _secureStorage.write(key: _userCacheKey, value: userJson);
  }

  // Get the cached user data
  T? getUser() {
    return user.value;
  }

  // Clear user data from storage
  void clearUserCache() async {
    user.value = null;
    await _secureStorage.delete(key: _userCacheKey);
  }

  // Load user data from storage during initialization
  Future<void> _loadUserFromCache() async {
    final userJson = await _secureStorage.read(key: _userCacheKey);

    if (userJson != null) {
      final Map<String, dynamic> userData = jsonDecode(userJson);

      // Determine the user type from the loaded data
      final UserType? userType = await getCurrentUserType();

      User? cachedUser;

      if (userType == UserType.freelancer) {
        cachedUser = Freelancer.fromJson(userData);
      } else if (userType == UserType.projectManager) {
        cachedUser = ProjectManager.fromJson(userData);
      } else {
        // Handle the case for other user types or fallback to a default user model
        cachedUser = User.fromJson(userData);
      }

      user.value = cachedUser as T;
    }
  }
}
