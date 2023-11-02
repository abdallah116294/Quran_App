import 'package:equatable/equatable.dart';


class DataEntity2 extends Equatable {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;
  // List<AyahsEntity2> ayahs;
  // EditionEntity2 edition;
  DataEntity2(
      {required this.number,
      required this.name,
      required this.englishName,
      required this.englishNameTranslation,
      required this.numberOfAyahs,
      required this.revelationType,
      // required this.ayahs,
      // required this.edition
      });

  @override
  List<Object?> get props => [
        number,
        name,
        englishName,
        englishNameTranslation,
        numberOfAyahs,
        revelationType,
      ];
}
