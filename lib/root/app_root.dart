import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/main/main_cubit.dart';
import '../cubit/main/main_state.dart';
import '../layout/splash_screen/splash_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => MainCubit()
              ..GetTools()
              ..GetPLants()
              ..GetSeeds()
              ..GetAll()
              ..GetFormul()
              ..getComment()
              ..getProfile()..getProfileNotify()..getblogs()),
      ],
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          //   var mainCubit = MainCubit.get(context);
          return ScreenUtilInit(
            designSize: const Size(360, 640),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, widget) => MaterialApp(
              builder: (context, widget) {
                return MediaQuery(
                  data:
                      MediaQuery.of(context).copyWith(textScaleFactor: 1.0.sp),
                  child: widget!,
                );
              },
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
