import 'package:quran/data/models/data_model2.dart';
import 'package:quran/domain/entities/quran2_entity.dart';

class QuranModel2 extends QuranEntity2 {
  QuranModel2(
      {required super.code, required super.status, required super.data});
  factory QuranModel2.fromJson(Map<String, dynamic> json) {
    return QuranModel2(code: json['code'], status: json['status'],
     data: json['data']!=null?(json['data']as List<dynamic>).map((e) =>DataModel2.fromJson(e) ).toList():null);
  }
}
