import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakathon_orange/core/component/commen_text.dart';

import 'package:hakathon_orange/cubit/main/main_cubit.dart';
import 'package:hakathon_orange/layout/home_screen/home_screen.dart';
import 'package:hakathon_orange/repo/src/local/cache_helper.dart';
import 'package:hakathon_orange/view/home_page/homepage.dart';

import '../../core/style/app_color/color.dart';
import '../../cubit/main/main_state.dart';
import '../../repo/src/local/cache_keys.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(milliseconds: 3800),
        () => Navigator.push(this.context,
            MaterialPageRoute(builder: (context) =>
            PreferenceUtils.getString(SharedKeys.apiToken) != null?HomePage():
            HomeScreen())));
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: kMainColor,
              body: Center(
                child: CommenAppText(font_size1: 36, font_size2: 36, imgWidth: 35)
              ));
        });
  }
}
