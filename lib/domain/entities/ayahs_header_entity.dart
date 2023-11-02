import 'package:equatable/equatable.dart';

import 'data_header_entity.dart';

class AyahsHeaderEntity extends Equatable {
  int? code;
  String? status;
  DataHeaderAayahsEntity? dataHeaderAayahsEntity;
  AyahsHeaderEntity({required this.status,required this.code, required this.dataHeaderAayahsEntity});
  @override
  // TODO: implement props
  List<Object?> get props => [
    code,
    status,
    dataHeaderAayahsEntity
  ];
}
