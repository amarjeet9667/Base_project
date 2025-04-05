import 'package:base_project_getx/app/utils/auth-storage.dart';
import 'package:base_project_getx/app/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/dialog_helper.dart';
import '../services/api_service.dart';

class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  var isLoading = false.obs; // To track API call loading state

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService _apiService = ApiService(); // API Service instance

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      DialogHelper.showErrorDialog(title: "Error",description: "Please enter email and password");
      return;
    }

    isLoading.value = true;
    DialogHelper.showLoading(); // Show loading dialog

    final response = await _apiService.post("/auth/login", {
      "email": email,
      "password": password,
    });

    final token = response?.data['token'];
    AppLogger.debug("Token ==> $token");
    if(token != null){
      await AuthStorage.saveToken(token);
      _apiService.setToken(token);
    }

    DialogHelper.hideLoading(); // Hide loading dialog

    if(email != "" && password != ''){ //Remove while using real api
    // if (response != null && response.statusCode == 200) { // Uncommnet while using real api
      DialogHelper.showSnackBar(title: "Login",message: "Login Successful");
      Get.offAllNamed("/home"); // Navigate to Home Screen
    } else {
      DialogHelper.showErrorDialog(title: "Error", description: "Invalid email or password");
    }

    isLoading.value = false;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
