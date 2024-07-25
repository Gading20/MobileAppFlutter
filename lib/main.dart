import 'package:deteksi_bacaan/app/constans/color.dart';
import 'package:deteksi_bacaan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    theme: ThemeDark,
    darkTheme: ThemeLight,
    debugShowCheckedModeBanner: false,
    title: "Application",
    initialRoute: Routes.INTRODUCTION,
    getPages: AppPages.routes,
  ));
}


