import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SurahaWidget extends StatelessWidget {
  const SurahaWidget(
      {super.key,
      required this.surahaName,
      required this.onPressed,
      required this.iconData,
      });
  final String surahaName;
  final VoidCallback onPressed;
 final IconData iconData;
  //final Icons icons;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration:
          const BoxDecoration(shape: BoxShape.rectangle, color: Color(0xff672CBC)),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            surahaName,
            style:  TextStyle(color: Colors.black, fontSize: 22.sp),
          ),
         // IconButton(onPressed: onPressed, icon:Icon(iconData) )
        ],
      )),
    );
  }
}
