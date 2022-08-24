import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/core/component/defaultText.dart';
import 'package:hakathon_orange/view/home_page/scan_page/commen_container/ExamContainer.dart';
import 'package:once/once.dart';

import '../../../core/style/app_color/color.dart';

class ExamPage extends StatefulWidget {


  
  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  String currentValue = 'Hello World';
  PageController?controller;
  void initState() {
    Once.runWeekly(
      'NotificationPage', callback: () {  }

    );
    Once.runOnEveryNewVersion(
      callback: () {
        /* What's new in 2.3.2 version? dialog */
      },
      fallback: () {
        /* Navigate to new screen */
      },
    );
    super.initState();
  }

  void set(String newOnce) {
    setState(
          () {
        currentValue = newOnce + ' ${Random().nextInt(100)}';
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.white,
        body:
        SingleChildScrollView(
          child: Column(
          children: [
            DefaultText(TextSt: "Course Exam"),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text("Question",style: TextStyle(color: Colors.black,fontSize: 36,fontWeight: FontWeight.w400),),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text("1",style: TextStyle(color:kSecColor ,fontSize: 36,fontWeight: FontWeight.w700),),

                  Container(alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(top: 10),
                      child: Text("/10",style: TextStyle(color: Colors.black.withOpacity(0.3),fontSize: 15,fontWeight: FontWeight.w400),)),

                ],
              ),
            ),
           SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text("What is the user experience?",style: TextStyle(color:Colors.black ,fontSize: 20,fontWeight: FontWeight.w400),),
            ),
            SizedBox(
              height: 25.h,
            ),

            ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.all(18.0),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ExamContainer();
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 30.0,
              ),
              itemCount: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 170),
              child: MaterialButton(

                onPressed: () {
                  // ScaffoldMessenger.of(context).showSnackBar(snackBar),
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                minWidth: 150,
                height: 50,
                color: kSecColor,
                child: const Text(
                  'Next',
                  style: TextStyle(color: kMainColor),
                ),
              ),
            ),

          ],

    ),
        ),
      );
  }
}
