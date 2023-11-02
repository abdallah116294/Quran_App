import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SurahaItemWidget extends StatelessWidget {
   SurahaItemWidget({
    super.key,
    required this.number,
    required this.name,
    required this.englishName,
    required this.numberOfAyahs,
    required this.revelationType
  });
   int number;
  final String name;
  final String englishName;
  final int numberOfAyahs;
  final String revelationType;
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          name,
          style: const TextStyle(color: Color(0xff863ED5), fontSize: 24),
        ),
        const Spacer(),
        // const SizedBox(
        //   width: 120,
        // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(englishName,style: TextStyle(color:const  Color(0xff240F4F),fontSize: 16.sp,fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Text("VERES  $number ",style: TextStyle(color: const Color(0xff8789A3),fontSize: 12.sp),),
                  SizedBox(width: 6.w,),
                  Text(revelationType,style: TextStyle(color: const Color(0xff8789A3),fontSize: 12.sp),),
                ],
              )
            ],
          ),
         SizedBox(
          width: 6.w,
        ),
        SizedBox(
          width: 36.w,
          height: 36.h,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 36.w,
                  height: 36.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(children: [
                    Image(image: AssetImage("assets/images/muslim2.png"))
                  ]),
                ),
              ),
               Center(
                 child: Positioned(
                  left: 0,
                  top: 7,
                  child: Text(
                    number.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF230E4E),
                      fontSize: 12.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                             ),
               ),
            ],
          ),
        )
      ],
    );
  }
}
