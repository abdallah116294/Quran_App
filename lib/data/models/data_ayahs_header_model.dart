import 'package:quran/data/models/ayahs_model.dart';

import '../../domain/entities/data_header_entity.dart';

class DataAyahsHeaderModel extends DataHeaderAayahsEntity {
  DataAyahsHeaderModel(
      {required super.number,
      required super.name,
      required super.englishName,
      required super.englishNameTranslation,
      required super.numberOfAyahs,
      required super.revelationType,
      required super.ayahs});
  factory DataAyahsHeaderModel.fromJson(Map<String, dynamic> json) {
    return DataAyahsHeaderModel(
        number: json["number"],
        name: json['name'],
        englishName: json['englishName'],
        englishNameTranslation: json['englishNameTranslation'],
        numberOfAyahs: json['numberOfAyahs'],
        revelationType: json['revelationType'],
        ayahs: json["ayahs"]!=null?(json["ayahs"]as List<dynamic>).map((e) => AyahsModel.fromJson(e)).toList():null);
  }
}
