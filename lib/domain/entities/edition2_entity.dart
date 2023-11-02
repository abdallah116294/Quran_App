import 'package:equatable/equatable.dart';

class EditionEntity2 extends Equatable {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  String? direction;
  EditionEntity2({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
    required this.direction,
  });
  @override
  List<Object?> get props => [
    identifier,
    language,
    name,
    englishName,
    format,
    type,
    direction,
  ];
}
