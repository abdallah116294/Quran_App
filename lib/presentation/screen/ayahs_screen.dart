import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/cubit/quran_cubit.dart';
import 'package:quran/injection_container.dart' as di;
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import '../widgets/ayah_widget.dart';
import '../widgets/surah_conainer_widget.dart';

class AyahsScreen extends StatelessWidget {
  AyahsScreen({super.key, required this.number});
  int? number;
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => di.sl<QuranCubit>()..getAyahs(number!),
      child: BlocBuilder<QuranCubit, QuranState>(builder: (context, state) {
        if (state is AyahsStateIsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AyahsStateLoaded) {
          return Column(
            children: [
          SurahContainerWidget(
            englishName: state
                .quranEntity2.dataHeaderAayahsEntity!.englishName
                .toString(),
            englishNameTranslation: state
                .quranEntity2.dataHeaderAayahsEntity!.englishNameTranslation
                .toString(),
            numberofAyahs: state
                .quranEntity2.dataHeaderAayahsEntity!.numberOfAyahs!
                .toInt(),
            revelationType: state
                .quranEntity2.dataHeaderAayahsEntity!.revelationType
                .toString(),
          ),
          Expanded(
            child: ListView.builder(
                controller: _controller,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20.r, right: 20.r),
                    child: AyahWidget(
                      number: state.quranEntity2.dataHeaderAayahsEntity!
                          .ayahs![index].numberInSurah,
                      text: state.quranEntity2.dataHeaderAayahsEntity!
                          .ayahs![index].text
                          .toString(),
                      onPressed1: () async {
                        await Share.share(state.quranEntity2
                            .dataHeaderAayahsEntity!.ayahs![index].text
                            .toString());
                      },
                      onPressed2: () {
                        Clipboard.setData(ClipboardData(
                                text: state
                                    .quranEntity2
                                    .dataHeaderAayahsEntity!
                                    .ayahs![index]
                                    .text
                                    .toString()))
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("تم نسخ النص بنجاح ")));
                        });
                      },
                    ),
                  );
                },
                itemCount: state.quranEntity2.dataHeaderAayahsEntity!
                    .ayahs!.length),
          )
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    ));
  }
}
//#DF98FA, #9055FF