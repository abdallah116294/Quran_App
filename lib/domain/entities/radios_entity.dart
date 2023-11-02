import 'package:equatable/equatable.dart';
import 'package:quran/domain/entities/radio_entity.dart';

class RadiosEntity extends Equatable {
  List<RadioEntity> radios;
  RadiosEntity({required this.radios});
  @override
  // TODO: implement props
  List<Object?> get props => [
    radios
  ];
}
