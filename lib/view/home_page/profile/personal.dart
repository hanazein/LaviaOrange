import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/core/utiles/navigation_utality/navigation_utiles.dart';
import 'package:hakathon_orange/cubit/main/main_cubit.dart';
import 'package:hakathon_orange/cubit/main/main_state.dart';
import 'package:hakathon_orange/view/home_page/profile/edit_email.dart';
import 'package:hakathon_orange/view/home_page/profile/edit_profile.dart';

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            children: [
              Image.asset(
                "assets/images/img_20.png",
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
              ),
              Padding(
                padding: EdgeInsets.only(left: 100, top: 80),
                child: CircleAvatar(
                  radius: 90,
                  child:  CachedNetworkImage(
                    imageUrl:
                    'https://lavie.orangedigitalcenteregypt.com${MainCubit.get(context).profile!.data.imageUrl}',
                    // في حالة التحميل
                    progressIndicatorBuilder: (context, url, progress) =>
                        CircularProgressIndicator(
                          value: progress.progress,
                        ),
                    // في حالة الخطا
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/img_21.png"),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        NavigationUtils.navigateBack(context: context);
                      },
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white.withOpacity(1),
                      ),
                    ),
                    SizedBox(
                      width: 240.w,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: ImageIcon(
                          const AssetImage(
                            "assets/images/img_22.png",
                          ),
                          color: Colors.white.withOpacity(1),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 120, top: 280),

                child: Row(
                  children: [
                    Text(
                      MainCubit.get(context).profile!.data.firstName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Roboto-Regular",
                          fontSize: 24),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      MainCubit.get(context).profile!.data.lastName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Roboto-Regular",
                          fontSize: 24),
                    ),
                  ],
                ),
                //  Text(MainCubit.get(context).loginModel!.data.user.firstName,style: TextStyle(color:Colors.white,fontWeight: FontWeight.w700,fontFamily: "Roboto-Regular",fontSize: 24),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 340),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      )),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 30, top: 20),
                        child: Container(
                          height: 70,
                          color: Colors.grey.withOpacity(0.1),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage("assets/images/img_23.png"),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                const Text(
                                  "You have 30 points",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto-Regular",
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 220),
                        child: Text(
                          "Edit Profile ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto-Regular",
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: 320,
                        height: 70,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                child: Image.asset("assets/images/img_24.png"),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              const Text(
                                "Change Name ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Roboto-Regular",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 80.w,
                              ),
                              IconButton(
                                  onPressed: () {
                                    NavigationUtils.navigateTo(
                                        context: context,
                                        destinationScreen: EditingName());
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xff1D592C),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: 320,
                        height: 70,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                child: Image.asset("assets/images/img_24.png"),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              const Text(
                                "Change Email",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Roboto-Regular",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 80.w,
                              ),
                              IconButton(
                                  onPressed: () {
                                    NavigationUtils.navigateTo(
                                        context: context,
                                        destinationScreen: EditingEmail());
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xff1D592C),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
