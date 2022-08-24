import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/core/utiles/navigation_utality/navigation_utiles.dart';
import 'package:hakathon_orange/view/home_page/scan_page/Blogs.dart';
import 'package:hakathon_orange/view/home_page/scan_page/commen_container/commen_container.dart';
import 'package:hakathon_orange/view/home_page/scan_page/exam_page.dart';

import '../../../core/style/app_color/color.dart';
import '../../../cubit/main/main_cubit.dart';
import '../../../cubit/main/main_state.dart';

class ScanImp extends StatelessWidget {







  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
    builder: (context, state) {

    return Scaffold(
      body:
          state is PlanetIdSuccessState?
      Stack(
        children: [
          Image.asset(
            "assets/images/img_16.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,

            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 10),
            child: ListView.separated(

              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.all(18.0),
              physics: BouncingScrollPhysics(),

              itemBuilder: (context, index){
                return Commen(IconP: "assets/images/img_14.png",);

              },
              separatorBuilder: (context, index) => SizedBox(height: 30.0,),
              itemCount: 3,
            ),
          ),
        Padding(padding: EdgeInsets.only(top: 300),
          child: Container(
            height:700,
            width: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,

            ),
            child:
            Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25,right: 80),
                child: Text(
                  MainCubit.get(context).plantList[0].name,
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height:12.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Text(
                  "Native to southern Africa, snake plants are well adapted to conditions similar to those in southern regions of the United States. Because of this, they may be grown outdoors for part of all of the year in USDA zones 8 and warmer",
                  style: TextStyle(fontSize: 16, color: Colors.grey.withOpacity(0.9)),
                ),
              ),
              SizedBox(
                height:12.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Text(
                  "Common Snake Plant Diseases",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height:12.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Text(
                  "A widespread problem with snake plants is root rot. This results from over-watering the soil of the plant and is most common in the colder months of the year. When room rot occurs, the plant roots can die due to a lack of oxygen and an overgrowth of fungus within the soil. If the snake plant's soil is soggy, certain microorganisms such as Rhizoctonia ",
                  style: TextStyle(fontSize: 16, color: Colors.grey.withOpacity(0.9)),
                ),
              ),
              SizedBox(
                height:12.h,
              ),
              MaterialButton(
                onPressed: () {
                  NavigationUtils.navigateTo(context: context, destinationScreen: Blogs());
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                minWidth: 330,
                height: 55,
                color: kSecColor,
                child: const Text(
                  'Go To Blog',
                  style: TextStyle(color: kMainColor),
                ),
              ),

            ],
            ),
          ),
        )

        ],
      ):CircularProgressIndicator()
    );

  });
}}
