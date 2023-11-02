import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/cubit/quran_cubit.dart';
import 'package:quran/injection_container.dart' as di;
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import '../widgets/ayah_widget.dart';

class AyahsScreen extends StatelessWidget {
  AyahsScreen({super.key, required this.number});
  int? number;
  @override
  Widget build(BuildContext context) {
    int? numbers;
    return Scaffold(
      body: BlocProvider(
        create: (context) => di.sl<QuranCubit>()..getAyahs(number!),
        child: BlocBuilder<QuranCubit, QuranState>(builder: (context, state) {
          if (state is AyahsStateIsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AyahsStateLoaded) {
            //number=state.quranEntity2.dataHeaderAayahsEntity!.ayahs![].number;
            return CustomScrollView(
              slivers: [
                SliverList(delegate: SliverChildListDelegate([
                   Padding(
                    padding:  EdgeInsets.all(30.0.r),
                    child: Container(
                      height: 250.h,
                      width: 327.w,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          gradient: const LinearGradient(
                              begin: Alignment(0.71, -0.71),
                              end: Alignment(-0.71, 0.71),
                              colors: [Color(0xffDF98FA), Color(0xff9055FF)])),
                              child: Stack(children: [
                                Positioned(
                                 // left: 0.0,
                                  child:Column(children: [
                                    const Spacer(flex: 2,),
                                     Text(state.quranEntity2.dataHeaderAayahsEntity!.englishName.toString(),style:  TextStyle(fontSize: 25.sp,color: Colors.white),),
                                     Text(state.quranEntity2.dataHeaderAayahsEntity!.englishNameTranslation.toString(),style:  TextStyle(fontSize: 12.sp,color: Colors.white),),
                                     const Divider(color: Colors.white,thickness:0.2 ,endIndent: 60,indent:60 ),
                                     Text("${state.quranEntity2.dataHeaderAayahsEntity!.numberOfAyahs}.${state.quranEntity2.dataHeaderAayahsEntity!.revelationType} VERSES",style: const TextStyle(fontSize: 12,color: Colors.white),),
                                      SizedBox(height: 32.h,),
                                      Text("بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ",style: TextStyle(fontSize: 28.sp,color: Colors.white),),
                                       const Spacer(flex: 3,),
                                  ],)
                                  )
                              ]),
                    ),
                  ),
                ])
                ),
                SliverList(delegate: SliverChildListDelegate([
                  ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.only(left: 20.r,right: 20.r),
              child: AyahWidget(
                number: state.quranEntity2.dataHeaderAayahsEntity!
                    .ayahs![index].numberInSurah,
                text: state
                    .quranEntity2.dataHeaderAayahsEntity!.ayahs![index].text
                    .toString(),
                onPressed1: () async {
                  await Share.share(state.quranEntity2
                      .dataHeaderAayahsEntity!.ayahs![index].text
                      .toString());
                },
                onPressed2: () {
                  Clipboard.setData(ClipboardData(text: state
                    .quranEntity2.dataHeaderAayahsEntity!.ayahs![index].text.toString()));
                },
              ),
            );
                            },
                            itemCount:
              state.quranEntity2.dataHeaderAayahsEntity!.ayahs!.length)
                ]),)
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
//#DF98FA, #9055FF