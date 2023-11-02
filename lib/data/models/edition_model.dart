import 'package:quran/domain/entities/edition_entity.dart';

class EditionModel extends EditionEntity {
  EditionModel(
      {required super.identifier,
      required super.language,
      required super.name,
      required super.englishName,
      required super.format,
      required super.type});
  factory EditionModel.fromJson(Map<String, dynamic> json) {
    return EditionModel(
        identifier: json['identifier'],
        language: json['language'],
        name: json['name'],
        englishName: json['englishName'],
        format: json['format'],
        type: json['type']);
  }
}
