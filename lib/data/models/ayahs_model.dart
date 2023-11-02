import 'package:quran/domain/entities/ayahs_entity.dart';

class AyahsModel extends AyahsEntity {
  AyahsModel(
      {required super.number,
      required super.text,
      required super.numberInSurah,
      required super.juz,
      required super.manzil,
      required super.page,
      required super.ruku,
      required super.hizbQuarter,
      required super.sajda});
  factory AyahsModel.fromJson(Map<String, dynamic> json) {
    return AyahsModel(
        number: json['number'],
        text: json['text'],
        numberInSurah: json['numberInSurah'],
        juz: json['juz'],
        manzil: json['manzil'],
        page: json['page'],
        ruku: json['ruku'],
        hizbQuarter: json['hizbQuarter'],
        sajda: json['sajda']);
  }
}
