import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/injection_container.dart' as di;
import 'package:quran/presentation/cubit/quran_cubit.dart';
import 'package:quran/presentation/screen/radio_screen.dart';
import 'package:quran/presentation/widgets/suraha_widget.dart';

class SurahaScreen extends StatefulWidget {
  const SurahaScreen({super.key});

  @override
  State<SurahaScreen> createState() => _SurahaScreenState();
}

class _SurahaScreenState extends State<SurahaScreen> {
  bool isPlay = true;
  // IconData iconData =const IconData(Icons.pause as int);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => di.sl<QuranCubit>()..getRadio(),
        child: Padding(
          padding:  EdgeInsets.all(8.0.r),
          child: BlocBuilder<QuranCubit, QuranState>(
            builder: (context, state) {
              if (state is RadiosStateIsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is RadiosStateLoaded) {
                return ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context)=>Directionality(textDirection: TextDirection.rtl,child: RadioScreen(radionName: state.radiosEntity.radios[index].name.toString(),url: state.radiosEntity.radios[index].url.toString(),))));
                        },
                        child: SurahaWidget(
                          iconData: isPlay ? Icons.play_arrow : Icons.pause,
                          surahaName: state.radiosEntity.radios[index].name
                              .toString(),
                          onPressed: () {
                            if (isPlay) {
                              QuranCubit.get(context).playAudio(
                                  url: state.radiosEntity.radios[index].url
                                      .toString());
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
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.radiosEntity.radios.length);
              } else if (state is RadiosStateError) {
                return Center(
                  child: Text(
                    state.msg.toString(),
                    style:  TextStyle(fontSize: 22.sp),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(color: Colors.purple),
              );
            },
          ),
        ),
      ),
    );
  }
}
