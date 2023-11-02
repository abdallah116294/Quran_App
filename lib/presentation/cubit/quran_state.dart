part of 'quran_cubit.dart';

sealed class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

final class QuranInitial extends QuranState {}

// final class QuranStateIsloading extends QuranState {}

// final class QuranStateLoaded extends QuranState {
//   //final Quran quranEntity;
//   final QuranEntity quran;
//   const QuranStateLoaded({required this.quran});
// }

// final class QuranStateError extends QuranState {
//   final String msg;
//   const QuranStateError({required this.msg});
// }

class RadiosStateIsLoading extends QuranState {}

class RadiosStateLoaded extends QuranState {
  final RadiosEntity radiosEntity;
  const RadiosStateLoaded({required this.radiosEntity});
}

class RadiosStateError extends QuranState {
  final String msg;
  const RadiosStateError({required this.msg});
}

final class SurahasStateIsloading extends QuranState {}

final class SurahaStateLoadeed extends QuranState {
  final QuranEntity2 quranEntity2;
  const SurahaStateLoadeed({required this.quranEntity2});
}

final class SurahaStateError extends QuranState {
  final String msg;
  const SurahaStateError({required this.msg});
}

final class AyahsStateIsLoading extends QuranState {}

final class AyahsStateLoaded extends QuranState {
  final AyahsHeaderEntity quranEntity2;
  const AyahsStateLoaded({required this.quranEntity2});

}
final class AyahsStateError extends QuranState {
  final String msg;
  const AyahsStateError({required this.msg});
  
}
