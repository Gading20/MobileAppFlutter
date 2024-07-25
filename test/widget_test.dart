import 'dart:convert';

import 'package:deteksi_bacaan/app/data/models/detail_surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() async {
  int juz = 1;
  List<Verse> PenampungAyat = [];
  List<Map<String, dynamic>> alljuz = [];
  for (var i = 1; i < 114; i++) {
    var res =
        await http.get(Uri.parse("https://api.quran.gading.dev/surah/$i"));
    Map<String, dynamic> RawData = json.decode(res.body)["data"];
    DetailSurah data = DetailSurah.fromJson(RawData);

    if (data.verses.isNull) {
      // ex: surah alfatihah => 7 ayat
      for (var ayat in data.verses) {
        if (ayat.meta?.juz == juz) {
          PenampungAyat.add(ayat);
        } else {
          // jika juznya bertambah
          print("====================");
          print("Berhasil Memasukan Juz $juz");
          print(PenampungAyat[0].text?.arab);
          alljuz.add({
            "juz": juz,
            "surah": data.name?.transliteration?.id ?? '',
            "juzStartInfo": PenampungAyat[0],
            "juzEndInfo": PenampungAyat[PenampungAyat.length - 1],
            "verses": PenampungAyat,
          });
          juz++;
          PenampungAyat.clear();
          PenampungAyat.add(ayat);
        }
      }
    }
  }
}
