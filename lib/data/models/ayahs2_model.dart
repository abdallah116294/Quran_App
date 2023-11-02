import 'package:quran/domain/entities/ayags_entity2.dart';

class AyahsModel2 extends AyahsEntity2 {
  AyahsModel2(
      {required super.number,
      required super.text,
      required super.numberInSurah,
      required super.juz,
      required super.manzil,
      required super.page,
      required super.ruku,
      required super.hizbQuarter,
      required super.sajda});
  factory AyahsModel2.fromJson(Map<String, dynamic> json) {
    return AyahsModel2(
        number: json['number'],
        text: json['text'],
        numberInSurah: json['numberInSurah'],
        juz: json['juz'],
        manzil:json ['manzil'],
        page: json['page'],
        ruku: json['ruku'],
        hizbQuarter: json['hizbQuarter'],
        sajda: json['sajda']);
  }
}
