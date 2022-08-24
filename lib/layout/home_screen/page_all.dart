import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/core/utiles/navigation_utality/navigation_utiles.dart';
import 'package:hakathon_orange/cubit/main/main_cubit.dart';
import 'package:hakathon_orange/cubit/main/main_state.dart';
import 'package:hakathon_orange/view/Search/search.dart';
import 'package:hakathon_orange/view/home_page/cart.dart';
import '../../core/component/commen_container.dart';
import '../../core/component/commen_text.dart';
import '../../core/style/app_color/color.dart';

class AllPage extends StatefulWidget {
  const AllPage({Key? key}) : super(key: key);

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> with SingleTickerProviderStateMixin {
  TabController? controller;

  void initState() {
    controller = new TabController(length: 4, vsync: this);
    controller!.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          for(int i=0;i<=MainCubit.get(context).dataList.length;i++){
            MainCubit.get(context).countProduct.add(0);
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child:
                    CommenAppText(font_size1: 35, font_size2: 35, imgWidth: 35),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      NavigationUtils.navigateTo(
                          context: context, destinationScreen: Search());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        width: 280,
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
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  InkWell(
                    onTap: () {
                      NavigationUtils.navigateTo(
                          context: context, destinationScreen: Cart());
                    },
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                          color: kSecColor,
                          borderRadius: BorderRadius.circular(13)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          "assets/images/img_12.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              TabBar(
                  controller: controller,
                  indicatorColor: Colors.white,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Container(
                        width: 60,
                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: controller!.index == 0
                                    ? kSecColor
                                    : Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "All",
                          style: TextStyle(
                              fontSize: 18,
                              color: controller!.index == 0
                                  ? kSecColor
                                  : Colors.grey.withOpacity(0.3)),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 60,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(6),
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: controller!.index == 1
                                    ? kSecColor
                                    : Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "Plants",
                          style: TextStyle(
                              fontSize: 16,
                              color: controller!.index == 1
                                  ? kSecColor
                                  : Colors.grey.withOpacity(0.3)),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 60,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(6),
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: controller!.index == 2
                                    ? kSecColor
                                    : Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "Seeds",
                          style: TextStyle(
                              fontSize: 16,
                              color: controller!.index == 2
                                  ? kSecColor
                                  : Colors.grey.withOpacity(0.3)),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 60,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: controller!.index == 3
                                    ? kSecColor
                                    : Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "Tools",
                          style: TextStyle(
                              fontSize: 20,
                              color: controller!.index == 3
                                  ? kSecColor
                                  : Colors.grey.withOpacity(0.3)),
                        ),
                      ),
                    ),
                  ]),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.85),
                        itemBuilder: (context, index) {
                          return CommenContainer(
                            index: index,
                            TextSt: MainCubit.get(context).dataList[index].name,
                            Price: MainCubit.get(context)
                                .dataList[index]
                                .price
                                .toString(),
                            Immege:
                                MainCubit.get(context).dataList[index].imageUrl,
                          );
                        },
                        itemCount: MainCubit.get(context).dataList.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.85),
                        itemBuilder: (context, index) {
                          return CommenContainer(
                              index: index,
                              TextSt:
                                  MainCubit.get(context).plantList[index].name,
                              Price: "100 ",
                              Immege: MainCubit.get(context)
                                  .plantList[index]
                                  .imageUrl);
                        },
                        itemCount: MainCubit.get(context).plantList.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.85),
                        itemBuilder: (context, index) {
                          return CommenContainer(
                            index: index,
                            TextSt: MainCubit.get(context).seedList[index].name,
                            Price: "100 ",
                            Immege:
                                MainCubit.get(context).seedList[index].imageUrl,
                          );
                        },
                        itemCount: MainCubit.get(context).seedList.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.85),
                        itemBuilder: (context, index) {
                          return CommenContainer(
                              index: index,

                              TextSt:
                                  MainCubit.get(context).toolList[index].name,
                              Price: "100",
                              Immege: MainCubit.get(context)
                                  .toolList[index]
                                  .imageUrl);

                        },
                        itemCount: MainCubit.get(context).toolList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
