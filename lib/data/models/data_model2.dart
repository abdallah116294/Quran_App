import 'package:quran/domain/entities/data2_entity.dart';


class DataModel2 extends DataEntity2 {
  DataModel2(
      {required super.number,
      required super.name,
      required super.englishName,
      required super.englishNameTranslation,
      required super.numberOfAyahs,
      required super.revelationType,});
  factory DataModel2.fromJson(Map<String, dynamic> json) {
    return DataModel2(
        number: json['number'],
       // ayahs:(json["ayahs"]as List<dynamic>).map((e) => AyahsModel2.fromJson(e)).toList(),
        name: json['name'],
        englishName: json['englishName'],
        englishNameTranslation: json['englishNameTranslation'],
        numberOfAyahs: json['numberOfAyahs'],
        revelationType: json['revelationType'], 
       // edition:EditionModel2.fromJson(json['edition'])
        );
  }
}
