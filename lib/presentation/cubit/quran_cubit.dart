import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/core/error/failures.dart';
import 'package:quran/core/usecase/usecase.dart';
import 'package:quran/domain/entities/ayahs_header_entity.dart';
import 'package:quran/domain/entities/quran2_entity.dart';
import 'package:quran/domain/usecases/get_quran_usecase.dart';

import '../../domain/entities/radios_entity.dart';
part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(
      {
        // required this.quranUseCase,
      required this.getRadiosUsecase,
      required this.player,
      required this.getSurahaUscase,
      required this.getAyahsUscase})
      : super(QuranInitial());
  static QuranCubit get(context) => BlocProvider.of(context);
//  GetQuranUseCase quranUseCase;
 // GetSuwarsUseCaes getSuwarsUseCaes;
  GetRadiosUsecase getRadiosUsecase;
  GetSurahaUscase getSurahaUscase;
  GetAyahsUscase getAyahsUscase;
  AudioPlayer player;

  // Future getData() async {
  //   emit(QuranStateIsloading());
  //   try {
  //     Either<Failure, QuranEntity> response = await quranUseCase(NoParams());
  //     emit(response.fold(
  //         (failure) => QuranStateError(msg: _mapFailureToMsg(failure)),
  //         (qurandata) => QuranStateLoaded(quran: qurandata)));
  //   } catch (error) {
  //     debugPrint("Error In cubit$error");
  //     emit(QuranStateError(msg: error.toString()));
  //   }
  // }
  Future<void> getRadio() async {
    emit(RadiosStateIsLoading());
    try {
      Either<Failure, RadiosEntity> suwars = await getRadiosUsecase(NoParams());
      emit(suwars.fold(
          (failure) => RadiosStateError(msg: _mapFailureToMsg(failure)),
          (radio) => RadiosStateLoaded(radiosEntity: radio)));
    } catch (error) {
      debugPrint(error.toString());
      emit(RadiosStateError(msg: error.toString()));
    }
  }

  Future<void> getSurah() async {
    emit(SurahasStateIsloading());
    try {
      Either<Failure, QuranEntity2> suwars = await getSurahaUscase(NoParams());
      emit(suwars.fold(
          (failure) => SurahaStateError(msg: _mapFailureToMsg(failure)),
          (suwars) => SurahaStateLoadeed(quranEntity2: suwars)));
    } catch (error) {
      debugPrint(error.toString());
      emit(SurahaStateError(msg: error.toString()));
    }
  }

  Future<void> getAyahs(int number) async {
    emit(AyahsStateIsLoading());
    try {
      Either<Failure, AyahsHeaderEntity> ahays = await getAyahsUscase(number);
      emit(ahays.fold(
          (failure) => AyahsStateError(msg: _mapFailureToMsg(failure)),
          (ayahs) => AyahsStateLoaded(quranEntity2: ayahs)));
    } catch (error) {
      debugPrint(error.toString());
      emit(AyahsStateError(msg: error.toString()));
    }
  }

  Future<void> playAudio({required String url}) async {
    // final player = AudioPlayer();
    final duration = await player.setUrl(url);
    await player.play();
  }

  void pause() {
    player.pause();
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "ServerFailure";
      case CacheFailure:
        return "CacheFailure";

      default:
        return "unexpectedError";
    }
  }
}
