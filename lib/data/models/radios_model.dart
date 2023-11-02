import 'package:quran/data/models/radio_mode.dart';
import '../../domain/entities/radios_entity.dart';

class RadiosModel extends RadiosEntity {
  RadiosModel({required super.radios});
  factory RadiosModel.fromJson(Map<String, dynamic> json) {
    if (json["radios"] != null) {
      List<RadioModel> radios = [];
      json["radios"].forEach((a) {
        radios.add(RadioModel.fromJson(a));
      });
      return RadiosModel(radios:radios );
    }else{
       List<RadioModel> radios = [];
      json["radios"].forEach((a) {
        radios.add(RadioModel.fromJson(a));
      });
      return RadiosModel(radios:radios );
    }
  }
}
