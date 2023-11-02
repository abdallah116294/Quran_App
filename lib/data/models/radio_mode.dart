import '../../domain/entities/radio_entity.dart';

class RadioModel extends RadioEntity {
  RadioModel({required super.id, required super.name, required super.url});
  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(id: json['id'], name: json['name'], url: json['url']);
  }
}
