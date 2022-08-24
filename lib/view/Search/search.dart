import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/core/component/commen_container.dart';

import 'package:hakathon_orange/core/component/default_search.dart';
import 'package:hakathon_orange/core/utiles/navigation_utality/navigation_utiles.dart';
import 'package:hakathon_orange/cubit/main/main_cubit.dart';


import '../../core/style/app_color/color.dart';
import '../../cubit/main/main_state.dart';

class Search extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
    builder: (context, state) {
    return Scaffold(
      backgroundColor: kMainColor,
      body:
      Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 45,right: 10,left: 10),
            child:
            DefaultSearch(
            ),
          ),

          MainCubit.get(context).dataList.isEmpty?
          Padding(
            padding: const EdgeInsets.only(top: 43),
            child: Column(
              children: [

                Container(
                    width: 230,
                    child: Image.asset("assets/images/img_29.png")),
                SizedBox(
                  height: 6.h,
                ),
                Text("Not Found",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  width: 280,
                    alignment: Alignment.center,
                    child: Text("Sorry, the keyword you entered cannot be found, please check again or search with another keyword.",style: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 20),)),
              ],
            ),
          )
              :
          Expanded(
            child:
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.7),
                itemBuilder: (context, index) {
                  return CommenContainer(
                    index: index,
                    TextSt: MainCubit.get(context).dataList[index].name,
                    Price: MainCubit.get(context)
                        .dataList[index]
                        .price
                        .toString(),
                    Immege:
                    MainCubit.get(context).dataList[index].imageUrl,
                  );
                },
                itemCount: MainCubit.get(context).dataList.length,
              ),
            ),
          )

        ],


      ),



    );

  });
}}
