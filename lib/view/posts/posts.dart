import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/core/component/defaultText.dart';
import 'package:hakathon_orange/core/utiles/navigation_utality/navigation_utiles.dart';
import 'package:hakathon_orange/view/posts/all_forms.dart';
import 'package:hakathon_orange/view/posts/search_post.dart';
import '../../core/style/app_color/color.dart';


class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> with SingleTickerProviderStateMixin {
  TabController? controller;
  TextEditingController uu = TextEditingController();

  @override
  void initState() {
    controller=new TabController(length: 2, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Column(
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
              DefaultText(TextSt: "Discussion Forums")
            ],
          ),
          SizedBox(
            height: 20.h,
          ),

  InkWell(
    onTap: (){NavigationUtils.navigateTo(context: context, destinationScreen: SearchForms());},
    child: Container(
      width: 310,
      height: 50,
      decoration: BoxDecoration(
      border:
      Border.all(color: Colors.grey.withOpacity(0.6)),
      borderRadius: BorderRadius.circular(13)),
      padding: const EdgeInsets.only(left: 10),
      child: Row(
      children: [
      Icon(
      Icons.search,
      color: Colors.grey.withOpacity(0.8),
      ),
      SizedBox(
      width: 4.w,
      ),
      Text(
      "Search",
      style: TextStyle(
      color: Colors.grey.withOpacity(0.8)),
      )
      ],
      ),
      ),
  ),


         SizedBox(
            height: 10.h,
          ),

          Padding(
            padding: const EdgeInsets.only(right: 110),
            child: DefaultTabController(length: 2,initialIndex:1 ,
              child: TabBar(
                  controller: controller,
                  indicatorColor: kMainColor,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,

                  tabs: [
                    Container(
                      width: 100,
              height: 30,
              decoration: BoxDecoration(
              color: kSecColor,
                borderRadius: BorderRadius.circular(5)),
                      child: Tab(
                        child: Text(
                          "All forums",
                          style: TextStyle(fontSize: 12, color: kMainColor),
                        ),
                      ),
                    ),

                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: kSecColor,
                        borderRadius: BorderRadius.circular(5)),
                      child: Tab(
                        child: Text(
                          "My forums",
                          style: TextStyle(fontSize: 12, color: kMainColor),
                        ),
                      ),
                    ),

                  ]),


            ),
          ),
          Expanded(

            child: TabBarView(children: [AllForms(),AllForms()],controller: controller,),
          )

        ],
    ),
      );

  }
}
