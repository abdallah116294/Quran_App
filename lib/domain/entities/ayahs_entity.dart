import 'dart:core';

import 'package:equatable/equatable.dart';

class AyahsEntity extends Equatable {
  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;
  AyahsEntity({
    required this.number ,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda
  });

  @override
  List<Object?> get props =>[
    number,

    text,
    numberInSurah,
    juz,
    manzil,
    page,
    ruku,
    hizbQuarter,
    sajda
  ];
}
