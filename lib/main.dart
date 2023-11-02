import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/cubit/quran_cubit.dart';
import 'package:quran/presentation/screen/splash_screen.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<QuranCubit>()..getSurah())
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return const MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                home: SplashScreen());
          },
        ));
  }
}
