
import 'package:dartz/dartz.dart';
import 'package:quran/core/error/failures.dart';
import 'package:quran/core/usecase/usecase.dart';
import '../entities/ayahs_header_entity.dart';
import '../entities/quran2_entity.dart';
import '../entities/radios_entity.dart';
import '../repositories/get_quran_repository.dart';
// class GetQuranUseCase implements UseCase<QuranEntity, NoParams> {
//   final QuranRepository quranRepository;
//   GetQuranUseCase({required this.quranRepository});
//   @override
//   Future<Either<Failure, QuranEntity>> call(NoParams params) =>
//       quranRepository.getQuranData();
// }



class GetRadiosUsecase implements UseCase<RadiosEntity, NoParams> {
  final QuranRepository quranRepository;
  GetRadiosUsecase({required this.quranRepository});
  @override
  Future<Either<Failure, RadiosEntity>> call(NoParams params) =>
      quranRepository.getRadios();
}

class GetSurahaUscase implements UseCase<QuranEntity2, NoParams> {
  final QuranRepository quranRepository;
  GetSurahaUscase({required this.quranRepository});
  @override
  Future<Either<Failure, QuranEntity2>> call(params) =>
      quranRepository.getSuraha();
}
class GetAyahsUscase implements UseCase<AyahsHeaderEntity, int> {
  final QuranRepository quranRepository;
  GetAyahsUscase({required this.quranRepository});
  @override
  Future<Either<Failure, AyahsHeaderEntity>> call(params) =>
      quranRepository.getAyahs(params);
}