import 'package:deteksi_bacaan/app/constans/color.dart';
import 'package:deteksi_bacaan/app/data/models/juz.dart' as juz;
import 'package:deteksi_bacaan/app/data/models/surah.dart';
import 'package:deteksi_bacaan/app/modules/home/views/deteksi.dart';
import 'package:deteksi_bacaan/app/modules/home/views/drawer.dart';
import 'package:deteksi_bacaan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Get.isDarkMode) {
      controller.isDark.value = true;
    }
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text(
          'Al-Quran Apps',
          style: TextStyle(color: appWhite),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalamualaikum",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Hai User"),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient:
                      LinearGradient(colors: [appPurpleLight1, appPurpleDark]),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.LAST_READ),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -55,
                            right: 0,
                            child: Opacity(
                              opacity: 0.7,
                              child: Container(
                                width: 200,
                                height: 200,
                                child: Image.asset(
                                  "assets/images/logo.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.menu_book_rounded,
                                      color: appWhite,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Terakhir dibaca",
                                      style: TextStyle(color: appWhite),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Text(
                                  "Al-Fatihah",
                                  style:
                                      TextStyle(color: appWhite, fontSize: 15),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Juz 1 | Ayat 5",
                                  style: TextStyle(color: appWhite),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TabBar(
                tabs: [
                  Tab(text: "Surah"),
                  Tab(text: "Juz"),
                  Tab(text: "Deteksi"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<Surah>>(
                      future: controller.getAllSurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData) {
                          return Center(child: Text("Tidak Ada Data"));
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Surah surah = snapshot.data![index];
                            return ListTile(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_SURAH,
                                    arguments: surah);
                              },
                              leading: Obx(
                                () => Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        controller.isDark.isTrue
                                            ? "assets/images/border_dark.png"
                                            : "assets/images/border_light.png",
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text("${surah.number}"),
                                  ),
                                ),
                              ),
                              title: Text("${surah.name?.transliteration?.id}"),
                              subtitle: Text(
                                "${surah.numberOfVerses} Ayat Al-Qur'an",
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                              trailing: Text("${surah.name?.long}"),
                            );
                          },
                        );
                      },
                    ),
                    FutureBuilder<List<juz.Juz>>(
                      future: controller.getAllJuz(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData) {
                          return Center(child: Text("Tidak Ada Data"));
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            juz.Juz detailjuz = snapshot.data![index];
                            return ListTile(
                              onTap: () {},
                              leading: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      Get.isDarkMode
                                          ? "assets/images/border_dark.png"
                                          : "assets/images/border_light.png",
                                    ),
                                  ),
                                ),
                                child: Center(child: Text("${index + 1}")),
                              ),
                              title: Text("Juz ${index + 1}"),
                              isThreeLine: true,
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Mulai dari ${detailjuz.juzStartInfo}"),
                                  Text("Sampai ${detailjuz.juzEndInfo}"),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Center(
                      child: AudioClassifierHomePage(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.isDarkMode
              ? Get.changeTheme(ThemeLight)
              : Get.changeTheme(ThemeDark);
          controller.isDark.toggle();
        },
        child: Obx(
          () => Icon(
            Icons.color_lens,
            color: controller.isDark.isTrue ? appPurpleDark : appWhite,
          ),
        ),
      ),
    );
  }
}
