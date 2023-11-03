import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/cubit/quran_cubit.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key, required this.radionName, required this.url});
  final String radionName;
  final String url;
  //final VoidCallback onPressed;
  // final IconData iconData;
  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool isPlay = true;
  @override
  void dispose() {
    // TODO: implement dispose
    QuranCubit.get(context).pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                widget.radionName,
                style: const TextStyle(color: Color(0xff672CBC)),
              ),
            ),
            body: BlocBuilder<QuranCubit, QuranState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Column(
                    children: [
                      // SurahaWidget(iconData: null, onPressed: () {  }, surahaName: '',)
                      Expanded(
                        child: Container(
                            // height:  MediaQuery.of(context).size.height,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r)),
                                color: const Color(0xff672CBC)),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    widget.radionName,
                                    style: TextStyle(fontSize: 60.sp),
                                  ),
                                  Icon(
                                    Icons.radio,
                                    weight: double.infinity,
                                    size: 200.w,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: IconButton(
                          onPressed: () {
                            if (isPlay) {
                              QuranCubit.get(context)
                                  .playAudio(url: widget.url);
                              setState(() {
                                isPlay = false;
                              });
                            } else {
                              QuranCubit.get(context).pause();
                              setState(() {
                                isPlay = true;
                              });
                            }
                          },
                          icon: Icon(isPlay ? Icons.play_arrow : Icons.pause),
                        ),
                      )
                    ],
                  ),
                );
              },
            )),
        onWillPop: () async {
          QuranCubit.get(context).pause();
          return true;
        });
  }
}
