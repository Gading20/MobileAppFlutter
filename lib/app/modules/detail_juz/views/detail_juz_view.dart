import 'package:deteksi_bacaan/app/constans/color.dart';
import 'package:deteksi_bacaan/app/data/models/juz.dart' as juz;
import 'package:deteksi_bacaan/app/data/models/surah.dart';
import 'package:deteksi_bacaan/app/modules/detail_juz/controllers/detail_juz_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  final juz.Juz detailJuz = Get.arguments["juz"];
  final List<Surah> allSurahJuz = Get.arguments["surah"];

  @override
  Widget build(BuildContext context) {
    allSurahJuz.forEach((element) {
      print(element.name!.transliteration!.id);
    });
    return Scaffold(
        appBar: AppBar(
          title: Text("Juz ${detailJuz.juz}"),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: detailJuz.verses?.length ?? 0,
          itemBuilder: (context, index) {
            if (detailJuz.verses == null || detailJuz.verses?.length == 0) {
              return Center(
                child: Text("Tidak ada data"),
              );
            }
            juz.Verses ayat = detailJuz.verses![index];
            if (index != 0) {
              if (ayat.number?.inSurah == 1) {
                controller.index++;
              }
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: appPurpleLight2.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
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
                              child: Center(
                                  child: Text("${ayat.number?.inSurah}")),
                            ),
                            Text(
                              "${allSurahJuz[controller.index].name?.transliteration?.id ?? ""}",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.bookmark_add_outlined),
                              color: Get.isDarkMode ? appWhite : appPurpleDark,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.play_arrow),
                              color: Get.isDarkMode ? appWhite : appPurpleDark,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "${ayat.text?.arab ?? ''}",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 10),
                Text(
                  "${ayat.text?.transliteration?.en ?? ''}",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 25),
                Text(
                  "${ayat.translation?.id ?? ''}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 50)
              ],
            );
          },
        ));
  }
}
