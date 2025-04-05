import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_project_getx/app/themes/app_theme.dart';
import 'package:base_project_getx/app/themes/dark_theme.dart';
import 'package:base_project_getx/app/themes/light_theme.dart';
import 'package:base_project_getx/app/utils/network_checker.dart';
import 'app/routes/app_routes.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures proper initialization

  // Initialize controllers
  Get.put(ThemeController());
  Get.put(NetworkChecker());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter GetX MVC",
          initialRoute: AppRoutes.splash,
          getPages: AppPages.pages,

          // ✅ Theme settings
          theme: LightTheme.theme,
          darkTheme: DarkTheme.theme,
          themeMode: themeController.theme, // Dynamically changes theme
        ));
  }
}
