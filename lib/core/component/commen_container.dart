import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/cubit/main/main_cubit.dart';



import '../../cubit/main/main_state.dart';

import '../style/app_color/color.dart';
class CommenContainer extends StatelessWidget {
   CommenContainer({this.index,required this.TextSt,required this.Immege, this.Price});
   String Immege;
   String?TextSt;
   String?Price;


int? index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
    builder: (context, state) {
    return

      SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: 140,
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(4, 4)
                    )
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [

              Container(
              width: 70,
                height: 90,
                child: CachedNetworkImage(
                imageUrl:
                  'https://lavie.orangedigitalcenteregypt.com${Immege}',
                  // في حالة التحميل
                  progressIndicatorBuilder: (context, url, progress) =>
                      CircularProgressIndicator(
                        value: progress.progress,
                      ),
                  // في حالة الخطا
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/images/img_6.png"),
                ),
              ),







                      SizedBox(
                        width: 6.w,
                      ),
                      InkWell(
                        onTap: (){MainCubit.get(context).changeCountDecrement(index);


                          },
                        child: Container(
                            width: 18,
                            height: 18,
                            color: Colors.grey,
                            child: Stack(
                              children: [
                                Center(
                                    child:
                                   Icon(Icons.remove,size: 15,)),
                              ],
                            )),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "${MainCubit.get(context).countProduct[index!]}",
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      InkWell(
                        onTap: (){MainCubit.get(context).changeCountIncrement(index);

                          },
                        child: Container(
                            width: 18,
                            height: 18,
                            color: Colors.grey,
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Center(
                                    child:
                                    Icon(Icons.add,size: 13,)
                                    ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                     TextSt!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                   height: 6.h,
                  ),
                  Row(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            Price!,

                            style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.w600),
                          )),

                      Container(
                          alignment: Alignment.centerLeft,

                          child: Text(
                            "EGP",
                            style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.w600),
                          )),
                    ],
                  ),

                  MaterialButton(
                    onPressed: () {
                      MainCubit.get(context).addToCartProducts(MainCubit.get(context).dataList[index!]);
                    MainCubit.get(context).addToCartPlants(MainCubit.get(context).plantList[index!]);
                    MainCubit.get(context).addToCartSeeds(MainCubit.get(context).seedList[index!]);
                    MainCubit.get(context).addToCartTools(MainCubit.get(context).toolList[index!]);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    minWidth: 100,
                    height: 35,
                    color: kSecColor,
                    child: const Text(
                      'Add To Cart',
                      style: TextStyle(color: kMainColor),
                    ),
                  )
                ],
              ),
            ),
        ]),
      );
  });
}}
