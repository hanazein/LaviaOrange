// @dart=2.9
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakathon_orange/cubit/observer/bloc_observer.dart';

import 'package:hakathon_orange/repo/src/local/cache_helper.dart';
import 'package:hakathon_orange/repo/src/remote/dio_helper.dart';
import 'package:hakathon_orange/root/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  await DioHelper.init();
  BlocOverrides.runZoned(
    () => runApp(
      const MyApp(),
    ),
    blocObserver: MyBlocObserver(),
  );
}
