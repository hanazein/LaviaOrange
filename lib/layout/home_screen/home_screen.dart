import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/core/component/commen_text.dart';
import 'package:hakathon_orange/layout/home_screen/login.dart';
import 'package:hakathon_orange/layout/home_screen/sign_up.dart';
import '../../core/style/app_color/color.dart';
import '../../cubit/main/main_cubit.dart';
import '../../cubit/main/main_state.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
   controller=new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: kMainColor,
              body: Column(
                children: [
                  Container(
                    width: 900,
                    padding: EdgeInsets.only(left: 250),
                    child: Image.asset(
                      "assets/images/img_1.png",
                      scale: 0.5,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CommenAppText(font_size1: 30, font_size2: 30, imgWidth: 30),
                  SizedBox(
                    height: 15.h,
                  ),

                    DefaultTabController(length: 2,initialIndex:1 ,
                      child: TabBar(
                        controller: controller,
                          indicatorColor: kSecColor,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,

                          tabs: [
                            Container(
                              width: 100,
                              child: Tab(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(fontSize: 20, color: kSecColor),
                                ),
                              ),
                            ),

                            Container(
                              width: 100,
                              child: Tab(
                                child: Text(
                                  "Login",
                                  style: TextStyle(fontSize: 20, color: kSecColor),
                                ),
                              ),
                            ),

                          ]),

                    ),

                   Expanded(

                     child: TabBarView(children: [SignUp(),LoginPage()],controller: controller,),
                   )




                ],
              ));
        });
  }
}
