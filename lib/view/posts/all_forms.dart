import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakathon_orange/core/utiles/navigation_utality/navigation_utiles.dart';
import 'package:hakathon_orange/cubit/main/main_cubit.dart';
import 'package:hakathon_orange/view/posts/add_posts.dart';
import 'package:hakathon_orange/view/posts/posts_container.dart';

import '../../core/style/app_color/color.dart';
import '../../cubit/main/main_state.dart';

class AllForms extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  return  BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
    builder: (context, state) {
      for(int i=0;i<=MainCubit.get(context).formullist.length;i++){
        MainCubit.get(context).countLike.add(0);
      }

      for(int i=0;i<=MainCubit.get(context).formullist.length;i++){
        MainCubit.get(context).countComments.add(0);
      }
    return
      Stack(
        children:[ ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.all(18.0),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return PostsContainer(index:index,data: MainCubit.get(context).formullist[index],ImageU: MainCubit.get(context).formullist[index].imageUrl,);
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 20.0,
        ),
        itemCount: MainCubit.get(context).formullist.length,
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
  });}

}
