import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AyahWidget extends StatelessWidget {
  AyahWidget(
      {super.key,
      required this.number,
      required this.text,
      required this.onPressed1,
      required this.onPressed2
      });
  int? number;
  String? text;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 327.w,
          height: 47.h,
          decoration: ShapeDecoration(
              color: const Color(0x0C121931),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r))),
          child: Padding(
            padding:  EdgeInsets.all(8.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: onPressed1,
                    icon: const Icon(Icons.share)),
                IconButton(
                    onPressed:onPressed2,
                    icon: const Icon(Icons.copy)),
                Container(
                  width: 42.h,
                  height: 42.w,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF863ED5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.50.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      number.toString(),
                      style:  TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          text!,
          style:  TextStyle(
            color: const Color(0xFF230E4E),
            fontSize: 18.sp,
            fontFamily: 'Amiri',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        )
      ],
    );
  }
}
