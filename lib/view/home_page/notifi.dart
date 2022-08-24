import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/core/component/defaultText.dart';
import 'package:hakathon_orange/cubit/main/main_cubit.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child: Column(
        children: [
          DefaultText(TextSt: "Notification"),
          SizedBox(
            height: 10.h,
          ),
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.all(18.0),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return
                Container(
                  width: double.infinity,
                  height: 60,
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage("assets/images/img_19.png")

                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Flexible(
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(MainCubit.get(context).userlist[index].message,style: TextStyle(color:Colors.black,fontSize: 14,fontFamily: "Poppins-Medium",fontWeight: FontWeight.w500),),
                          SizedBox(
                            height: 10.h,
                          ),

                     SizedBox(
                       height: 5.h,
                     ),

                          Text(MainCubit.get(context).userlist[index].createdAt.toString(),style: TextStyle(color:Color(0xffA5ACB8).withOpacity(0.8),fontSize: 15,),),
                        ],
                      ),
                    )

                  ],
              ),
                );
            },
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              color: Color(0xffE8EBF0),

            ),
            

            itemCount: MainCubit.get(context).userlist.length,
          ),

        ],

    ),
      );

  }
}
