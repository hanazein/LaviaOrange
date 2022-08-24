import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/core/component/defaultText.dart';
import 'package:hakathon_orange/cubit/main/main_cubit.dart';

import '../../../core/style/app_color/color.dart';
import '../../../core/utiles/navigation_utality/navigation_utiles.dart';

class Blogs extends StatelessWidget {
  const Blogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          
      SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: IconButton(
                    onPressed: () {
                      NavigationUtils.navigateBack(context: context);
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black.withOpacity(1),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100.w,
                ),
                DefaultText(TextSt: "Blogs")
                
              ],
            ),
            SizedBox(
             height: 12.h,
            ),
            ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.all(18.0),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(color: Colors.white54,borderRadius: BorderRadius.circular(15),  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1),
                          offset: Offset(4, 4)
                      )]),
                      child:Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                            child: CachedNetworkImage(
                              width: 140,
                              imageUrl:
                              'https://lavie.orangedigitalcenteregypt.com${MainCubit.get(context).planrbloglist[index].imageUrl}',
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
                            width: 12.w,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20,),
                            child: Column(
                              children: [
                                Text("2 days ago",style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.bold),),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(MainCubit.get(context).planrbloglist[index].name,style: TextStyle(color:kSecColor,fontSize: 11,fontWeight: FontWeight.bold),),
                                SizedBox(
                                  width: 3.w,
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(MainCubit.get(context).planrbloglist[index].description,style: TextStyle(color:kSecColor,fontSize: 9,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          )
                        ],
                      ) ,
                    ),
                  );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 20.0,
              ),
              itemCount: MainCubit.get(context).planrbloglist.length,
            ),
          ],
        ),
      ),
    );

  }
}
