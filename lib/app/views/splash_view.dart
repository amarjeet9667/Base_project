import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      bool isLoggedIn = checkUserLoggedIn();
      if (isLoggedIn) {
        Get.offNamed(AppRoutes.home);
      } else {
        Get.offNamed(AppRoutes.login);
      }
    });

    return Scaffold(
      body: Center(child: CircularProgressIndicator()), // Loading indicator
    );
  }

  bool checkUserLoggedIn() {
    // Replace this with actual login status check (e.g., shared preferences)
    return false; // false means user is not logged in
  }
}
