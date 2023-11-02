import 'package:quran/domain/entities/surah_entity.dart';
import 'ayahs_model.dart';

class SurahsModel extends SurahsEntity {
  SurahsModel(
      {required super.number,
      required super.name,
      required super.englishName,
      required super.revelationType,
      required super.ayahs, required super.englishNameTranslation});
  factory SurahsModel.fromJson(Map<String, dynamic> json) {
    // if (json["ayahs"] != null) {
    //   List<AyahsModel> ayahsList = [];
    //   json["ayahs"].forEach((a) {
    //     ayahsList.add(AyahsModel.fromJson(a));
    //   });
    //   return SurahsModel(
    //       number: json['number'],
    //       name: json['name'],
    //       englishName: json['englishName'],
    //       revelationType: json['revelationType'],
    //       ayahs: ayahsList);
    // }else{
    //   return SurahsModel(
    //       number: json['number'],
    //       name: json['name'],
    //       englishName: json['englishName'],
    //       revelationType: json['revelationType'],
    //       ayahs: null);
    // }
    return SurahsModel(
        number: json['number'],
        name: json['name'],
        englishName: json['englishName'],
        englishNameTranslation: json['englishNameTranslation'],
        revelationType: json['revelationType'],
        ayahs: json["ayahs"]!=null?(json["ayahs"]as List<dynamic>).map((e) => AyahsModel.fromJson(e)).toList():null
        );
  }
}
