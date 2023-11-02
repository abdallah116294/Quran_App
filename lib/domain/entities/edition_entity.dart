import 'package:equatable/equatable.dart';

class EditionEntity extends Equatable {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
EditionEntity({
required this.identifier,
required this.language,
required this.name,
required this.englishName,
required this.format,
required this.type,
});
  @override
  List<Object?> get props =>[
    identifier,
    language,
    name,
    englishName,
    format,
    type,
  ];
}
