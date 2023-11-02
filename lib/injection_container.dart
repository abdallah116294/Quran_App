import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/core/api/dio_helper.dart';
import 'package:quran/data/datasource/remote_datasource.dart';
import 'package:quran/data/repositories/get_quran_repo_impl.dart';
import 'package:quran/domain/repositories/get_quran_repository.dart';
import 'package:quran/domain/usecases/get_quran_usecase.dart';
import 'package:quran/presentation/cubit/quran_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //bloc
  sl.registerFactory<QuranCubit>(() => QuranCubit(
      getRadiosUsecase: sl(),
      getSurahaUscase: sl(),
      getAyahsUscase: sl(),
      player: sl()));
  //usecase
  // sl.registerLazySingleton<GetQuranUseCase>(
  //     () => GetQuranUseCase(quranRepository: sl()));
  sl.registerLazySingleton<GetRadiosUsecase>(
      () => GetRadiosUsecase(quranRepository: sl()));
  sl.registerLazySingleton<GetSurahaUscase>(
      () => GetSurahaUscase(quranRepository: sl()));
  sl.registerLazySingleton<GetAyahsUscase>(() => GetAyahsUscase(quranRepository: sl()));
  //data Source
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDatasourceImpl(dioHelper: sl()));
  //repository
  sl.registerLazySingleton<QuranRepository>(
      () => GetQuranRepositoryImpl(remoteDataSource: sl()));
  //dio helper
  sl.registerLazySingleton(() => DioHelper(sl()));
  sl.registerLazySingleton(() => Dio());
  //audio
  sl.registerLazySingleton(() => AudioPlayer());
}
