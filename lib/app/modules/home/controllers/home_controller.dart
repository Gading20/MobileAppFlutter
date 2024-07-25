import 'dart:convert';

// import 'package:deteksi_bacaan/app/data/models/surah.dart';
import 'package:deteksi_bacaan/app/data/models/juz.dart';
import 'package:deteksi_bacaan/app/data/models/surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List<Surah> allSurah = [];
  RxBool isDark = false.obs;
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah");
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      allSurah = data.map((e) => Surah.fromJson(e)).toList();
      return allSurah;
    }
  }

//   Future<List<Juz>> getAllJuz() async {
//     List<Juz> alljuz = [];
//     for (int i = 0; i < 30; i++) {
//       Uri url = Uri.parse("https://api.quran.gading.dev/juz/$i");
//       var res = await http.get(url);

//       Map<String, dynamic> data =
//           (json.decode(res.body) as Map<String, dynamic>)["data"];

//       Juz juz = Juz.fromJson(data);
//       alljuz.add(juz);
//     }
//     return alljuz;
//   }
// }

//   Future<List<Juz>> getAllJuz() async {
//     List<Juz> allJuz = [];
//     for (int i = 1; i <= 30; i++) {
//       try {
//         Uri url = Uri.parse("https://api.quran.gading.dev/juz/$i");
//         var res = await http.get(url);

//         if (res.statusCode == 200) {
//           Map<String, dynamic> data = json.decode(res.body);
//           if (data.containsKey("data") &&
//               data["data"] is Map<String, dynamic>) {
//             Juz juz = Juz.fromJson(data["data"]);
//             allJuz.add(juz);
//             print("Loaded Juz $i");
//           } else {
//             print("Failed to load Juz $i: Invalid data format");
//           }
//         } else {
//           // Handle error if response status code is not 200
//           print("Failed to load Juz $i: ${res.statusCode}");
//         }
//       } catch (e) {
//         // Handle other errors
//         print("Error loading Juz $i: $e");
//       }
//     }
//     return allJuz;
//   }
// }
  Future<List<Juz>> getAllJuz() async {
    List<Juz> allJuz = [];
    for (int i = 1; i <= 30; i++) {
      try {
        Uri url = Uri.parse("https://api.quran.gading.dev/juz/$i");
        var res = await http.get(url);

        if (res.statusCode == 200) {
          Map<String, dynamic> data = json.decode(res.body);
          if (data.containsKey("data") &&
              data["data"] is Map<String, dynamic>) {
            Juz juz = Juz.fromJson(data["data"]);
            allJuz.add(juz);
            print("Loaded Juz $i");
          } else {
            print("Failed to load Juz $i: Invalid data format");
          }
        } else {
          print("Failed to load Juz $i: ${res.statusCode}");
        }
      } catch (e) {
        print("Error loading Juz $i: $e");
      }
    }
    return allJuz;
  }
}
