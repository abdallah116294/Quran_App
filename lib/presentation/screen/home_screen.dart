import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/cubit/quran_cubit.dart';
import 'package:quran/presentation/screen/ayahs_screen.dart';
import 'package:quran/presentation/screen/surah_screen.dart';

import '../widgets/item_widget.dart';
import 'package:quran/injection_container.dart' as di;

class HomScreen extends StatefulWidget {
  const HomScreen({super.key});

  @override
  State<HomScreen> createState() => _HomScreenState();
}

class _HomScreenState extends State<HomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Quran App",
              style: TextStyle(color: const Color(0xff672CBC), fontSize: 28.sp),
              textAlign: TextAlign.left,
            ),
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Directionality(
                          textDirection: TextDirection.rtl,
                          child: SurahaScreen())));
                },
                icon: const Icon(
                  Icons.radio_rounded,
                  color: Color(0xff672CBC),
                ))),
        body: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: BlocProvider(
            create: (context) => di.sl<QuranCubit>()..getSurah(),
            child:
                BlocBuilder<QuranCubit, QuranState>(builder: (context, state) {
              if (state is SurahasStateIsloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SurahaStateLoadeed) {
                return ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) => Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: AyahsScreen(
                                          number: state
                                              .quranEntity2.data![index].number!
                                              .toInt(),
                                        ))));
                          },
                          child: SurahaItemWidget(
                            englishName: state
                                .quranEntity2.data![index].englishName
                                .toString(),
                            name:
                                state.quranEntity2.data![index].name.toString(),
                            number:
                                state.quranEntity2.data![index].number!.toInt(),
                            numberOfAyahs: state
                                .quranEntity2.data![index].numberOfAyahs!
                                .toInt(),
                            revelationType: state
                                .quranEntity2.data![index].revelationType
                                .toString(),
                          ));
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.quranEntity2.data!.length);
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff672CBC),
                ),
              );
            }),
          ),
        ));
  }
}
