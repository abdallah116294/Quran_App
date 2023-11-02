import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            "Quran App",
            style: TextStyle(color:const Color(0xff672CBC), fontSize: 28.sp),
          ),
           SizedBox(
            height: 40.h,
          ),
           Center(
              child: Image(
            image: const AssetImage("assets/images/fram1.png"),
            width: 314.w,
            height: 450.h,
          )),
           SizedBox(
            height: 20.h,
          ),
          //450//
          Container(
            height: 60.h,
            width: 185.w,
            decoration: BoxDecoration(
                color: const Color(0xffF9B091),
                borderRadius: BorderRadius.circular(30.r)),
            child: Center(
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Directionality(textDirection: TextDirection.rtl,child: HomScreen())));
                    },
                    child:  Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ))),
          ),
        ],
      ),
    );
  }
}
