
import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/core/utiles/navigation_utality/navigation_utiles.dart';
import 'package:hakathon_orange/cubit/main/main_state.dart';
import 'package:hakathon_orange/models/login/login.dart';

import 'package:hakathon_orange/view/home_page/homepage.dart';


import '../../core/style/app_color/color.dart';
import '../../cubit/main/main_cubit.dart';
class LoginPage extends StatelessWidget {
  TextEditingController tt = TextEditingController();

  TextEditingController uu = TextEditingController();

  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            NavigationUtils.navigateTo(context: context, destinationScreen: HomePage());
          }

            else{}
        },
    builder: (context, state) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 19),
              child: Text(
                "Email",
                style: TextStyle(color: Color(0xff6F6F6F)),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 330,
              child: TextFormField(
                textInputAction: TextInputAction.done,
                controller: tt,
                keyboardType: TextInputType.emailAddress,
                cursorHeight: 0,
                cursorColor: Colors.black,
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return 'cancel';
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (String? val) {
                  print(val!);
                },
                onChanged: (String? val) {
                  print(val!);
                },
                decoration: InputDecoration(
                    // suffixIcon: Icon(Icons.add_circle_outline),
                    // errorBorder: InputBorder
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: NeedColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: NeedColor),
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 19),
              child: Text(
                "Password",
                style: TextStyle(color: Color(0xff6F6F6F)),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 330,
              child: TextFormField(
                textInputAction: TextInputAction.done,
                controller: uu,
                keyboardType: TextInputType.emailAddress,
                cursorHeight: 0,
                cursorColor: Colors.black,
                obscureText: true,
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return 'cancel';
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (String? val) {
                  print(val!);
                },
                onChanged: (String? val) {
                  print(val!);
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: NeedColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: NeedColor),
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
            ),
            SizedBox(height: 25.h),
            ConditionalBuilder(
              condition:
              state is! LoginLoadingState,
              builder: (context)=>
               MaterialButton(
                onPressed: () {


                  // ScaffoldMessenger.of(context).showSnackBar(snackBar),
                  if (formkey.currentState!.validate()) {
                    MainCubit.get(context).userLogin(email:tt.text, password: uu.text);
               //  NavigationUtils.navigateTo(context: context, destinationScreen: HomePage());
                  }

                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                minWidth: 330,
                height: 55,
                color: kSecColor,
                child: const Text(
                  'Login',
                  style: TextStyle(color: kMainColor),
                ),
              ), fallback: (context)=>
                Center(child: CircularProgressIndicator(),)
            ),
            SizedBox(height: 20.h),
            Container(
              width: 330,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Text(
                    "or continue with",
                    style: TextStyle(color: Color(0xff979797)),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 20,
                    child: Image.asset(
                      'assets/images/img_4.png',
                    )),
                SizedBox(
                  width: 40.w,
                ),
                Container(
                    width: 15,
                    child: Image.asset(
                      'assets/images/img_2.png',
                    )),
              ],
            ),
            Container(
              width: 800,
              padding: EdgeInsets.only(right: 200),
              child: Image.asset(
                "assets/images/img_3.png",
                scale: 1,
              ),
            ),
          ],
        ),
      ),
    );
  });
}}
