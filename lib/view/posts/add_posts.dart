import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/cubit/main/main_cubit.dart';

import '../../core/component/defaultText.dart';
import '../../core/style/app_color/color.dart';
import '../../core/utiles/navigation_utality/navigation_utiles.dart';

class AddPosts extends StatelessWidget {

  TextEditingController tt = TextEditingController();

  TextEditingController uu = TextEditingController();
  TextEditingController rr = TextEditingController();


  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.white,
        body:
        SingleChildScrollView(
          child: Column(
          children: [
            Row(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: IconButton(onPressed: (){NavigationUtils.navigateBack(context: context);}, icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,)),
                ),
                SizedBox(
                  width: 30.w,
                ),
                DefaultText(TextSt: "Create New Post")
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: kSecColor,),borderRadius: BorderRadius.circular(10)

                ),
                child:
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Icon(Icons.add,color:kSecColor ,size: 30,),
                      SizedBox(
                        height: 10.h,
                      ),
                        Text("Add photo ",style: TextStyle(color:kSecColor,fontWeight: FontWeight.w400,fontSize: 14 ),)
                    ],

                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 19),
              child: Text(
                "Title",
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
                "Description",
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
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 40),
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
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 19),
              child: Text(
                "ImegeUrl",
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
                controller: rr,
                cursorHeight: 0,
                cursorColor: Colors.black,
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return 'cancel';
                  } else {
                    return null;
                  }
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
                 SizedBox(
                   height: 20.h,
                 ),
            MaterialButton(
              onPressed: () {
                MainCubit.get(context).FormualPost(title: tt.text, description: uu.text, imageBase64:rr.text );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              minWidth: 330,
              height: 55,
              color: kSecColor,
              child: const Text(
                'Post',
                style: TextStyle(color: kMainColor),
              ),
            ),

          ],
    ),
        ),
      );

  }
}
