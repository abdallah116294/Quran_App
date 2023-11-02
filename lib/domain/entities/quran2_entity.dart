import 'package:equatable/equatable.dart';
import 'data2_entity.dart';

class QuranEntity2 extends Equatable {
  int? code;
  String? status;
  List<DataEntity2>? data;
  QuranEntity2({required this.code, required this.status, required this.data});

  @override
 
  List<Object?> get props => 
  [
    code,
    status,
    data,
  ];
}
