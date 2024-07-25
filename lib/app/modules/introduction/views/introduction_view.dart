import 'package:deteksi_bacaan/app/constans/color.dart';
import 'package:deteksi_bacaan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Al-Qur'an Apps",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Voice Deteksi dan Membaca Al-Qur'an",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              child: Lottie.asset("assets/lotties/animation.json"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.REGISTER),
              child: Text(
                "Mulai",
                style:
                    TextStyle(color: Get.isDarkMode ? appPurpleDark : appWhite),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Get.isDarkMode ? appWhite : appPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 90, vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
