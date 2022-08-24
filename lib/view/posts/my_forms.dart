import 'package:flutter/material.dart';
import 'package:hakathon_orange/view/posts/add_posts.dart';
import 'package:hakathon_orange/view/posts/posts_container.dart';

import '../../core/style/app_color/color.dart';
import '../../core/utiles/navigation_utality/navigation_utiles.dart';

class MyForms extends StatelessWidget {
  const MyForms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      Stack(
        children: [ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.all(18.0),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return SizedBox();
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 30.0,
        ),
        itemCount: 20,
    ),
          Padding(
            padding: const EdgeInsets.only(top: 400,left: 280),
            child:
            InkWell(
              onTap: (){NavigationUtils.navigateTo(context: context, destinationScreen: AddPosts());},
              child: CircleAvatar(
                radius: 25,
                backgroundColor: kSecColor,
                child:
                Container(
                    width: 20,
                    child: Image.asset("assets/images/img_28.png")),

              ),
            ),
          )
    ]);
  }
}
