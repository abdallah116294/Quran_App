import 'package:equatable/equatable.dart';

import 'ayahs_entity.dart';

class DataHeaderAayahsEntity extends Equatable {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;
  List<AyahsEntity>? ayahs;
  DataHeaderAayahsEntity({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
    required this.ayahs,
  });
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
