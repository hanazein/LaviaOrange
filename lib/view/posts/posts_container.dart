import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/cubit/main/main_cubit.dart';
import 'package:hakathon_orange/cubit/main/main_state.dart';

import '../../core/style/app_color/color.dart';
import '../../models/formul.dart';

class PostsContainer extends StatelessWidget {
  PostsContainer({required this.index,required this.data,required this.ImageU});
  int? index;
  Datumm data;
  String?ImageU;
  bool lo=false;

  TextEditingController uu = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
    builder: (context, state) {
    return
      SingleChildScrollView(
        child: Stack(
          children:[
            Column(
              children: [
                Container(
          width:330 ,
                height: 240,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.3))

                ),
                child:
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage:  AssetImage("assets/images/img_25.png"),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(MainCubit.get(context).formullist[index!].user.firstName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14),),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(MainCubit.get(context).formullist[index!].user.lastName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14),),
                                ],
                              ),
                              SizedBox(
                               height: 2.h,
                              ),
                              Text("a month ago",style: TextStyle(color: Color(0x979797D6).withOpacity(0.5),fontWeight: FontWeight.w400,fontSize: 12),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                     height: 15.h,
                    ),
                    Container(alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 7),
                        child: Text(MainCubit.get(context).formullist[index!].title,style: TextStyle(color: kSecColor,fontWeight: FontWeight.w700,fontSize: 14),)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 7),
                        child: Text(MainCubit.get(context).formullist[index!].description,style: TextStyle(color: Color(0x979797D6).withOpacity(0.8),fontWeight: FontWeight.w400,fontSize: 14),)),

                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child:  CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                          'https://lavie.orangedigitalcenteregypt.com${ImageU}',
                          // في حالة التحميل
                          progressIndicatorBuilder: (context, url, progress) =>
                              CircularProgressIndicator(
                                value: progress.progress,
                              ),
                          // في حالة الخطا
                          errorWidget: (context, url, error) =>
                              Image.asset("assets/images/img_26.png"),
                        ),
                      ),
                    ),





                  ],
                ),

    ),
                Row(
                  children: [
                    Container(
                      width: 35,
                      child: IconButton(onPressed: (){
                        MainCubit.get(context).FormualPostLike(forumId: data.forumId);
                        MainCubit.get(context).changeLikeIncrement(index);
                        lo=true;

                      },
                        icon:   ImageIcon(
                        AssetImage("assets/images/img_27.png",),
                          color:
                          state is AddLikeSuccessState?Colors.grey.withOpacity(0.3):Colors.blue
                      //
                      ),),
                    ),

                    Text("${MainCubit.get(context).countLike[index!]}",style: TextStyle(color: Colors.grey.withOpacity(0.8),fontWeight: FontWeight.w700,fontSize: 11),),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text("Likes",style: TextStyle(color: Colors.grey.withOpacity(0.8),fontWeight: FontWeight.w700,fontSize: 11),),
                    SizedBox(
                      width: 40.w,
                    ),

                    Text("${MainCubit.get(context).countComments[index!]}",style: TextStyle(color: Colors.grey.withOpacity(0.8),fontWeight: FontWeight.w700,fontSize: 11),),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text("Replies",style: TextStyle(color: Colors.grey.withOpacity(0.8),fontWeight: FontWeight.w700,fontSize: 11),),


                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 220,
                      height: 30,
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: uu,
                        cursorHeight: 0,

                        cursorColor: Colors.black,
                        decoration: InputDecoration(

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
                     width: 12.w,
                    ),
                    MaterialButton(
                      onPressed: () {
                        MainCubit.get(context).FormualPostComment(comment: uu.text, forumId: data.forumId );
                        MainCubit.get(context).changeCommentIncrement(index);

                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      minWidth: 80,
                      height: 30,
                      color: kSecColor,
                      child: const Text(
                        'Post',
                        style: TextStyle(color: kMainColor),
                      ),
                    ),
                  ],
                ),



              ],
            ),

        ]),
      );
  });
}}
