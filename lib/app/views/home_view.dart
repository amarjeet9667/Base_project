import 'package:base_project_getx/app/constants/app_colors.dart';
import 'package:base_project_getx/app/constants/app_text_style.dart';
import 'package:base_project_getx/app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final ThemeController themeController = Get.find<ThemeController>();

  HomeView({super.key}); // Get ThemeController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(
                themeController.isDarkMode.value
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              onPressed: themeController.toggleTheme, // Toggle theme on press
            ),
          ),
        ],
      ),
      body: Center(
        child: Obx(
          () => Text(
            "Counter: ${controller.count}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
