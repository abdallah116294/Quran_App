import 'package:equatable/equatable.dart';

import 'ayahs_entity.dart';

class SurahsEntity extends Equatable {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  List<AyahsEntity>? ayahs;
  SurahsEntity(
      {required this.number,
      required this.name,
      required this.englishName,
      required this.englishNameTranslation,
      required this.revelationType,
      required this.ayahs});
  @override
  List<Object?> get props => [
    number,
    name,
    englishName,
    englishNameTranslation,
    revelationType,
    ayahs,
  ];
}
