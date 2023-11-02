import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quran/core/error/failures.dart';
import 'package:quran/data/datasource/remote_datasource.dart';
import 'package:quran/domain/entities/quran2_entity.dart';
import 'package:quran/domain/entities/radios_entity.dart';
import 'package:quran/domain/repositories/get_quran_repository.dart';

import '../models/ayahs_header_models.dart';
class GetQuranRepositoryImpl implements QuranRepository {
  final RemoteDataSource remoteDataSource;
  GetQuranRepositoryImpl({required this.remoteDataSource});
  // @override
  // Future<Either<Failure, QuranEntity>> getQuranData() async {
  //   try {
  //     final qurandata = await remoteDataSource.getData();
  //     return Right(qurandata);
  //   } catch (error) {
  //     return Left(ServerFailure());
  //   }
  // }
  @override
  Future<Either<Failure, RadiosEntity>> getRadios() async {
    try {
      var radiosdata = await remoteDataSource.getRadios();
      return Right(radiosdata);
    } catch (error) {
      debugPrint("$error");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, QuranEntity2>> getSuraha()async {
      try {
      var suraha = await remoteDataSource.getSuraha();
      return Right(suraha);
    } catch (error) {
      debugPrint("$error");
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, AyahsHeaderModel>> getAyahs(int number)async {
       try {
      var ayahs = await remoteDataSource.getAyahs(number);
      return Right(ayahs);
    } catch (error) {
      debugPrint("$error");
      return Left(ServerFailure());
    }
  }
}
