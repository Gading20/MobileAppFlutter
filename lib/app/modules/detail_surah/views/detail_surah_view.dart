import 'package:deteksi_bacaan/app/constans/color.dart';
import 'package:deteksi_bacaan/app/data/models/detail_surah.dart' as detail;
import 'package:deteksi_bacaan/app/data/models/surah.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  final Surah surah = Get.arguments;

  @override
  Widget build(BuildContext context) {
    if (Get.isDarkMode) {
      controller.isDark.value = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Al-Qur'an Apps",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          GestureDetector(
            onTap: () => Get.dialog(Dialog(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Get.isDarkMode
                      ? appPurpleDark.withOpacity(0.3)
                      : appWhite,
                ),
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Tafsir ${surah.name?.transliteration?.id}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "${surah.tafsir?.id ?? "Tidak ada tafsir di surah ini."}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    appPurpleLight1,
                    appPurpleDark,
                  ])),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "${surah.name?.transliteration?.id?.toUpperCase()}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: appWhite,
                      ),
                    ),
                    Text(
                      "( ${surah.name?.translation?.id?.toUpperCase()} )",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: appWhite,
                      ),
                    ),
                    Text(
                      "${surah.numberOfVerses} Ayat ",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: appWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          FutureBuilder<detail.DetailSurah>(
            future: controller.getDetailSurah(surah.number.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData || snapshot.data == null) {
                return Center(
                  child: Text("Tidak Ada Data"),
                );
              }
              detail.DetailSurah? detailSurah = snapshot.data;

              return ListView.builder(
                // padding: EdgeInsets.all(20),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: detailSurah?.verses.length ?? 0,
                itemBuilder: (context, index) {
                  detail.Verse? ayat = detailSurah?.verses[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appPurpleLight2.withOpacity(0.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(Get.isDarkMode
                                        ? "assets/images/border_light.png"
                                        : "assets/images/border_dark.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                child: Center(child: Text("${index + 1}")),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.bookmark_add_outlined),
                                    color: Get.isDarkMode
                                        ? appWhite
                                        : appPurpleDark,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.play_arrow),
                                    color: Get.isDarkMode
                                        ? appWhite
                                        : appPurpleDark,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${ayat?.text?.arab ?? ''}",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${ayat?.text?.transliteration?.en ?? ''}",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "${ayat?.translation?.id ?? ''}",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(height: 50)
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
