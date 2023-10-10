import 'package:get/get.dart';
import 'package:jobify/app/data/enums/response_value.dart';
import 'package:jobify/app/data/enums/user_type.dart';
import 'package:jobify/app/data/models/user/freelancer.dart';
import 'package:jobify/app/data/models/user/project_manager.dart';
import 'package:jobify/app/data/services/api_services.dart';
import 'package:jobify/app/data/services/user_cache_service.dart';

class UserRepository {
  final ApiService _apiService = Get.find<ApiService>();

  final CacheService _cacheService = Get.find<CacheService>();

  // Log in user with provided username and password
  Future<String> login(String userName, String password) async {
    // Send a POST request to the API for user login
    final response = await _apiService.postData(
        'user/login?username=$userName&password=$password', null);

    // Check if login was successful
    if (response.statusCode == 200 && response.data['errorMessage'] == "") {
      // Save the authentication token to the cache
      await _cacheService.saveAuthToken(response.data['result']);

      // Get the current user type from the API
      final userTypeResponse = await _apiService.getData('user/GetCurrentID');
      if (userTypeResponse.statusCode == 200) {
        final userType = userTypeResponse.data['result']['type'];
        // Save the user type to the cache
        await _cacheService.saveUserType(userType);
      }
      // Fetch additional user data
      await getUserData();
      return '';
    } else {
      return response.data['errorMessage'];
    }
  }

  // Create a new user account
  Future<String> createAccount({
    firstName,
    lastName,
    email,
    phoneNumber,
    username,
    password,
    userType,
    gender,
  }) async {
    // Send a POST request to the API to create a new user account
    final response = await _apiService.postData(
      'user/SetUser',
      {
        "Firstname": firstName,
        "Lastname": lastName,
        "Password": password,
        "PhoneNumber": phoneNumber,
        "Type": userType,
        "Gender": gender,
        "Email": email,
        "UserName": username,
      },
    );

    // Check if the account creation was successful
    if (response.statusCode == 200 && response.data['errorMessage'] == "") {
      // Automatically log in the newly created user
      await login(username, password);
      return '';
    } else {
      return response.data['errorMessage'];
    }
  }

  // Send a confirmation code via email
  Future<ResponseValue> sendConfirmationCodeEmail(
      {required String email}) async {
    // Send a POST request to the API to request a confirmation code via email
    final response = await _apiService.postData(
        'mailing/RequestConfirmationCode?email=$email', null);
    if (response.statusCode == 200 && response.data == '') {
      return ResponseValue.success;
    } else {
      return ResponseValue.failed;
    }
  }

  // Confirm email using a code
  Future<String> confirmEmail({required String code}) async {
    // Send a POST request to the API to confirm email using a code
    final response =
        await _apiService.postData('user/ConfirmEmail?confirmCode=$code', null);
    if (response.statusCode == 200 &&
        response.data['result'].toString().contains('successfully')) {
      return response.data['errorMessage'];
    } else {
      return response.data['errorMessage'];
    }
  }

  // Get user data based on the current user type
  Future<dynamic> getUserData() async {
    // Retrieve the current user type from the cache
    final currentUserType = await _cacheService.getCurrentUserType();

    final getUserID = await _apiService.getData('user/GetCurrentID');

    if (getUserID.statusCode == 200) {
      if (currentUserType != null) {
        var requestDataUrl = '';

        // Determine the API endpoint based on user type
        if (currentUserType == UserType.freelancer) {
          requestDataUrl =
              'user/GetFreelancerDetailAPI?id=${getUserID.data['result']['id']}';
        } else if (currentUserType == UserType.projectManager) {
          requestDataUrl =
              'user/GetProjectManagerDetailAPI?id=${getUserID.data['result']['id']}';
        }

        // Fetch user data from the API
        final response = await _apiService.getData(requestDataUrl);

        if (response.statusCode == 200 && response.data['result'] != null) {
          _cacheService.clearUserCache();
          if (currentUserType == UserType.freelancer) {
            // Deserialize user data as Freelancer model
            final user = Freelancer.fromJson(response.data['result']);

            // Save the user type and user data to the cache
            await _cacheService.saveUserType(currentUserType.index);
            await _cacheService.saveUser(user );

            return user;
          } else if (currentUserType == UserType.projectManager) {
            // Deserialize user data as ProjectManager model
            final user = ProjectManager.fromJson(response.data['result']);

            // Save the user type and user data to the cache
            _cacheService.saveUserType(currentUserType.index);
            await _cacheService.saveUser(user);
            return user;
          }
        }
      }
    }
  }
}
