import 'package:quran/data/models/data_ayahs_header_model.dart';

import '../../domain/entities/ayahs_header_entity.dart';

class AyahsHeaderModel extends AyahsHeaderEntity{
  AyahsHeaderModel({required super.code, required super.dataHeaderAayahsEntity, required super.status});
factory AyahsHeaderModel.fromJson(Map<String,dynamic>json){
  return AyahsHeaderModel(status: json["status"],code: json['code'], dataHeaderAayahsEntity:json["data"]!=null?DataAyahsHeaderModel.fromJson(json["data"]) :null);
}
}