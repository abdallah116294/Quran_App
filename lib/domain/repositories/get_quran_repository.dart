import 'package:dartz/dartz.dart';
import 'package:quran/core/error/failures.dart';
import '../entities/ayahs_header_entity.dart';
import '../entities/quran2_entity.dart';
import '../entities/radios_entity.dart';

abstract class QuranRepository {
  // Future<Either<Failure, QuranEntity>> getQuranData();
  Future<Either<Failure, RadiosEntity>> getRadios();
  Future<Either<Failure, QuranEntity2>> getSuraha();
  Future<Either<Failure, AyahsHeaderEntity>> getAyahs(int number);
}
