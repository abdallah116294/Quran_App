import '../../domain/entities/edition2_entity.dart';

class EditionModel2 extends EditionEntity2 {
  EditionModel2(
      {required super.identifier,
      required super.language,
      required super.name,
      required super.englishName,
      required super.format,
      required super.type,
      required super.direction});
  factory EditionModel2.fromJson(Map<String, dynamic> json) {
    return EditionModel2(
        identifier: json['identifier'],
        language: json['language'],
        name: json['name'],
        englishName: json['englishName'],
        format: json['format'],
        type: json['type'],
        direction: json['direction']);
  }
}
