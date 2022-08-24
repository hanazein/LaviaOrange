import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hakathon_orange/cubit/main/main_cubit.dart';
import 'package:hakathon_orange/cubit/main/main_state.dart';
import 'package:hakathon_orange/layout/home_screen/page_all.dart';

import 'package:hakathon_orange/view/home_page/notifi.dart';
import 'package:hakathon_orange/view/home_page/profile/personal.dart';
import 'package:hakathon_orange/view/home_page/scan_page/commen_container/qr.dart';
import 'package:hakathon_orange/view/home_page/scan_page/scan_page.dart';
import 'package:hakathon_orange/view/posts/posts.dart';

import '../../core/style/app_color/color.dart';

int value = 0;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  List<Widget> widthgetOptions = <Widget>[
    Posts(),
    Qrr(),
    AllPage(),
    NotificationPage(),
    PersonalPage(),
  ];
  @override
  void initState() {
    controller = new TabController(length: 4, vsync: this);

    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              bottomNavigationBar: CurvedNavigationBar(
                height: 60.0,
                items: <Widget>[
                  ImageIcon(
                    AssetImage("assets/images/img_7.png"),
                  ),
                  ImageIcon(
                    AssetImage("assets/images/img_8.png"),
                  ),
                  ImageIcon(
                    AssetImage("assets/images/img_9.png"),
                  ),
                  ImageIcon(
                    AssetImage("assets/images/img_15.png"),
                  ),
                  ImageIcon(
                    AssetImage("assets/images/img_11.png"),
                  ),
                ],
                animationDuration: Duration(milliseconds: 600),
                backgroundColor: kSecColor,
                onTap: (index) {
                  MainCubit.get(context).changeItem(index);
                },
                index: MainCubit.get(context).currentIndex,
              ),
              backgroundColor: kMainColor,
              body: widthgetOptions[MainCubit.get(context).currentIndex]
          );
        });
  }
}
