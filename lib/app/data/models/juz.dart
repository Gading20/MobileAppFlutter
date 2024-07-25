// API URL : https://api.quran.gading.dev/juz/1
// GET all ayat per juz Al-Qur'an

import 'package:deteksi_bacaan/app/data/models/ayat.dart';

class Juz {
  int? juz;
  int? juzStartSurahNumber;
  int? juzEndSurahNumber;
  String? juzStartInfo;
  String? juzEndInfo;
  int? totalVerses;
  List<Verses>? verses;

  Juz(
      {this.juz,
      this.juzStartSurahNumber,
      this.juzEndSurahNumber,
      this.juzStartInfo,
      this.juzEndInfo,
      this.totalVerses,
      this.verses});

  Juz.fromJson(Map<String, dynamic> json) {
    juz = json['juz'];
    juzStartSurahNumber = json['juzStartSurahNumber'];
    juzEndSurahNumber = json['juzEndSurahNumber'];
    juzStartInfo = json['juzStartInfo'];
    juzEndInfo = json['juzEndInfo'];
    totalVerses = json['totalVerses'];
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(Verses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['juz'] = this.juz;
    data['juzStartSurahNumber'] = this.juzStartSurahNumber;
    data['juzEndSurahNumber'] = this.juzEndSurahNumber;
    data['juzStartInfo'] = this.juzStartInfo;
    data['juzEndInfo'] = this.juzEndInfo;
    data['totalVerses'] = this.totalVerses;
    if (this.verses != null) {
      data['verses'] = this.verses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Verses {
  Number? number;
  Meta? meta;
  Text? text;
  Translation? translation;
  Audio? audio;
  Tafsir? tafsir;

  Verses(
      {this.number,
      this.meta,
      this.text,
      this.translation,
      this.audio,
      this.tafsir});

  Verses.fromJson(Map<String, dynamic> json) {
    number = json['number'] != null ? Number.fromJson(json['number']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    text = json['text'] != null ? Text.fromJson(json['text']) : null;
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    audio = json['audio'] != null ? Audio.fromJson(json['audio']) : null;
    tafsir = json['tafsir'] != null ? Tafsir.fromJson(json['tafsir']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.number != null) {
      data['number'] = this.number!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.text != null) {
      data['text'] = this.text!.toJson();
    }
    if (this.translation != null) {
      data['translation'] = this.translation!.toJson();
    }
    if (this.audio != null) {
      data['audio'] = this.audio!.toJson();
    }
    if (this.tafsir != null) {
      data['tafsir'] = this.tafsir!.toJson();
    }
    return data;
  }
}

// ... (other model classes remain the same)
