import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/core/utiles/navigation_utality/navigation_utiles.dart';
import 'package:hakathon_orange/cubit/main/main_cubit.dart';

import '../../core/style/app_color/color.dart';
import '../../cubit/main/main_state.dart';


class Cart extends StatelessWidget {
   Cart({Key? key}) : super(key: key);
  var list;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {

        },
    builder: (context, state) {

    return Scaffold(
   body:
   SingleChildScrollView(
     child: Center(
       child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.only(top: 40),
             child: Row(
               children: [
                 IconButton(onPressed: (){NavigationUtils.navigateBack(context: context);}, icon: Icon(Icons.arrow_back_outlined)),
                 Padding(
                   padding: const EdgeInsets.only(left: 90),
                   child: Text("My cart",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                 ),
               ],
             ),

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
                             'https://lavie.orangedigitalcenteregypt.com${MainCubit.get(context).addToCart[index].imageUrl}',
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
                           padding: const EdgeInsets.all(4.0),
                           child:
                           Column(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(top: 12),
                                 child: Text(MainCubit.get(context).addToCart[index].name,style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                               ),
                               SizedBox(
                                height: 12.h,
                               ),
                               Row(
                                 children: [
                                   Text(MainCubit.get(context).addToCart[index].price.toString(),style: TextStyle(color:kSecColor,fontSize: 16,fontWeight: FontWeight.bold),),
                                   SizedBox(
                                     width: 3.w,
                                   ),
                                   Text("EGP",style: TextStyle(color:kSecColor,fontSize: 13,fontWeight: FontWeight.bold),),
                                 ],
                               ),
                               SizedBox(
                                 height: 12.h,
                               ),
                               Container(
                                 width:115,
                                 height:35,

                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.withOpacity(0.4)),
                                 child:
                                 Stack(
                                   children:[ Row(
                                     children: [
                                       Container(child: IconButton(onPressed:(){}, icon: Icon(Icons.remove),color:kSecColor ,)),
                                       SizedBox(
                                         width: 2.w,
                                       ),
                                       Text("1",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                       SizedBox(
                                         width: 2.w,
                                       ),

                                       IconButton(onPressed:(){}, icon: Icon(Icons.add),color:kSecColor ,),
                                     ],
                                   ),
                                 ]),
                               )
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
             itemCount: MainCubit.get(context).addToCart.length,
           ),
           ListView.separated(
             scrollDirection: Axis.vertical,
             shrinkWrap: true,
             padding: EdgeInsets.all(18.0),
             physics: BouncingScrollPhysics(),
             itemBuilder: (context, index) {
               return
                 Padding(
                   padding: const EdgeInsets.all(4.0),
                   child: Container(
                     height: 140,
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
                             'https://lavie.orangedigitalcenteregypt.com${MainCubit.get(context).addToCartt[index].imageUrl}',
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
                           padding: const EdgeInsets.all(4.0),
                           child: Column(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(top: 12),
                                 child: Text(MainCubit.get(context).addToCartt[index].name,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                               ),
                               SizedBox(
                                 height: 12.h,
                               ),
                               Row(
                                 children: [
                                   Text("200",style: TextStyle(color:kSecColor,fontSize: 16,fontWeight: FontWeight.bold),),
                                   SizedBox(
                                     width: 3.w,
                                   ),
                                   Text("EGP",style: TextStyle(color:kSecColor,fontSize: 16,fontWeight: FontWeight.bold),),
                                 ],
                               ),
                               SizedBox(
                                 height: 12.h,
                               ),
                               Container(
                                 width:115,
                                 height:35,

                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.withOpacity(0.4)),
                                 child:
                                 Stack(
                                     children:[ Row(
                                       children: [
                                         Container(child: IconButton(onPressed:(){}, icon: Icon(Icons.remove),color:kSecColor ,)),
                                         SizedBox(
                                           width: 2.w,
                                         ),
                                         Text("1",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                         SizedBox(
                                           width: 2.w,
                                         ),

                                         IconButton(onPressed:(){}, icon: Icon(Icons.add),color:kSecColor ,),
                                       ],
                                     ),
                                     ]),
                               )
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
             itemCount: MainCubit.get(context).addToCart.length,
           ),
           ListView.separated(
             scrollDirection: Axis.vertical,
             shrinkWrap: true,
             padding: EdgeInsets.all(18.0),
             physics: BouncingScrollPhysics(),
             itemBuilder: (context, index) {
               return
                 Padding(
                   padding: const EdgeInsets.all(4.0),
                   child: Container(
                     height: 140,
                     decoration: BoxDecoration(color: Colors.white54,borderRadius: BorderRadius.circular(15),  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1),
                         offset: Offset(4, 4)
                     )]),
                     child:Row(
                       children: [
                         Container(
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                           child:CachedNetworkImage(
                             width: 140,
                             imageUrl:
                             'https://lavie.orangedigitalcenteregypt.com${MainCubit.get(context).addToCartt2[index].imageUrl}',
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
                           padding: const EdgeInsets.all(4.0),
                           child: Column(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(top: 12),
                                 child: Text(MainCubit.get(context).addToCartt2[index].name,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                               ),
                               SizedBox(
                                 height: 12.h,
                               ),
                               Row(
                                 children: [
                                   Text("200",style: TextStyle(color:kSecColor,fontSize: 16,fontWeight: FontWeight.bold),),
                                   SizedBox(
                                     width: 3.w,
                                   ),
                                   Text("EGP",style: TextStyle(color:kSecColor,fontSize: 16,fontWeight: FontWeight.bold),),
                                 ],
                               ),
                               SizedBox(
                                 height: 12.h,
                               ),
                               Container(
                                 width:115,
                                 height:35,

                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.withOpacity(0.4)),
                                 child:
                                 Stack(
                                     children:[ Row(
                                       children: [
                                         Container(child: IconButton(onPressed:(){}, icon: Icon(Icons.remove),color:kSecColor ,)),
                                         SizedBox(
                                           width: 2.w,
                                         ),
                                         Text("1",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                         SizedBox(
                                           width: 2.w,
                                         ),

                                         IconButton(onPressed:(){}, icon: Icon(Icons.add),color:kSecColor ,),
                                       ],
                                     ),
                                     ]),
                               )
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
             itemCount: MainCubit.get(context).addToCart.length,
           ),
           ListView.separated(
             scrollDirection: Axis.vertical,
             shrinkWrap: true,
             padding: EdgeInsets.all(18.0),
             physics: BouncingScrollPhysics(),
             itemBuilder: (context, index) {
               return
                 Padding(
                   padding: const EdgeInsets.all(4.0),
                   child: Container(
                     height: 140,
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
                             'https://lavie.orangedigitalcenteregypt.com${MainCubit.get(context).addToCartt3[index].imageUrl}',
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
                           padding: const EdgeInsets.all(4.0),
                           child: Column(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(top: 12),
                                 child: Text(MainCubit.get(context).addToCartt3[index].name,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                               ),
                               SizedBox(
                                 height: 12.h,
                               ),
                               Row(
                                 children: [
                                   Text("200",style: TextStyle(color:kSecColor,fontSize: 16,fontWeight: FontWeight.bold),),
                                   SizedBox(
                                     width: 3.w,
                                   ),
                                   Text("EGP",style: TextStyle(color:kSecColor,fontSize: 16,fontWeight: FontWeight.bold),),
                                 ],
                               ),
                               SizedBox(
                                 height: 12.h,
                               ),
                               Container(
                                 width:115,
                                 height:35,

                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.withOpacity(0.4)),
                                 child:
                                 Stack(
                                     children:[ Row(
                                       children: [
                                         Container(child: IconButton(onPressed:(){}, icon: Icon(Icons.remove),color:kSecColor ,)),
                                         SizedBox(
                                           width: 2.w,
                                         ),
                                         Text("1",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                         SizedBox(
                                           width: 2.w,
                                         ),

                                         IconButton(onPressed:(){}, icon: Icon(Icons.add),color:kSecColor ,),
                                       ],
                                     ),
                                     ]),
                               )
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
             itemCount: MainCubit.get(context).addToCart.length,
           ),
           SizedBox(
             height: 5.h,
           ),
           Padding(
             padding: const EdgeInsets.only(left: 35),
             child: Row(
               children: [
                 Text("Total",style: TextStyle(color:Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                 SizedBox(
                   width: 78.w,
                 ),

                 Text("18.000",style: TextStyle(color:kSecColor,fontSize: 30,fontWeight: FontWeight.bold),),
                 SizedBox(
          width: 4.w,
                 ),
                 Text("EGP",style: TextStyle(color:kSecColor,fontSize: 30,fontWeight: FontWeight.bold),),

               ],
             ),
           ),
           SizedBox(
             height: 9.h,
           ),
           MaterialButton(
             onPressed: () {
               // ScaffoldMessenger.of(context).showSnackBar(snackBar),
             },
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(12.0)),
             minWidth: 330,
             height: 55,
             color: kSecColor,
             child: const Text(
               'Checkout ',
               style: TextStyle(color: kMainColor),
             ),
           ),



         ],
       ),
     ),
   ) ,
    );

  });

}}
