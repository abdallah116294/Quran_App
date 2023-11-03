import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SurahContainerWidget extends StatelessWidget {
  const SurahContainerWidget(
      {super.key,
      required this.englishName,
      required this.englishNameTranslation,
      required this.numberofAyahs,
      required this.revelationType
      });
  final String englishName;
  final String englishNameTranslation;
  final int numberofAyahs;
  final String revelationType;
  //${state.quranEntity2.dataHeaderAayahsEntity!.numberOfAyahs}.${state.quranEntity2.dataHeaderAayahsEntity!.revelationType}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(35.0.r),
      child: Container(
        height: 250.h,
        width: 327.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            gradient: const LinearGradient(
                begin: Alignment(0.71, -0.71),
                end: Alignment(-0.71, 0.71),
                colors: [Color(0xffDF98FA), Color(0xff9055FF)])),
        child: Stack(children: [
          Positioned(
              // left: 0.0,
              child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                englishName,
                style: TextStyle(fontSize: 25.sp, color: Colors.white),
              ),
              SizedBox(height: 15.h,),
              Text(
                englishNameTranslation,
                style: TextStyle(fontSize: 12.sp, color: Colors.white),
              ),
              SizedBox(height: 15.h,),
              const Divider(
                  color: Colors.white,
                  thickness: 0.4,
                  endIndent: 60,
                  indent: 60),
                  SizedBox(height: 15.h,),
              Text(
                "${revelationType+"\t"+numberofAyahs.toString()} .VERSES",
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ",
                style: TextStyle(fontSize: 28.sp, color: Colors.white),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ))
        ]),
      ),
    );
  }
}
