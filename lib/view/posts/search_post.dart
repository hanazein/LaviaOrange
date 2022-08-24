import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakathon_orange/view/posts/posts_container.dart';

import '../../core/style/app_color/color.dart';
import '../../cubit/main/main_cubit.dart';
import '../../cubit/main/main_state.dart';

class SearchForms extends StatelessWidget {
  TextEditingController uu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
    builder: (context, state) {
    return Scaffold(
      backgroundColor: kMainColor,
      body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50,right: 10,left: 10),
            child:  TextFormField(
              textInputAction: TextInputAction.search,
              style: const TextStyle(
                color: Colors.black,
              ),
              controller: uu,
              keyboardType: TextInputType.text,
              //   cursorHeight: 0,
// obscureText: true,
              cursorColor: Colors.black,
              validator: (String? val) {
                if (val!.isEmpty && val != uu.text) {
                  return "can't not found";
                } else {
                  return null;
                }
              },

              onFieldSubmitted: (val) {
                MainCubit.get(context).searchFormual(val);
              },
              onChanged: (String? val) {
                MainCubit.get(context).searchFormual(val!);
              },

              decoration: InputDecoration(

                  label: const Text('search'),
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(Icons.search,color: Colors.grey,),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0,),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.grey.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(13),
                  )),
            ),

          ),

          MainCubit.get(context).formullist.isEmpty?Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Container(
                    width: 230,
                    child: Image.asset("assets/images/img_29.png")),
              ),
            ],
          )
              :
          Expanded(
            child:
            ListView.separated(
                itemBuilder: (context, index) {
                  return
                      PostsContainer(index:index,data: MainCubit.get(context).formullist[index],ImageU: MainCubit.get(context).formullist[index].imageUrl);
                },
                separatorBuilder: (context, index) => const Divider(
                  thickness: 0.1,
                  color: Colors.black87,
                ),
                itemCount: MainCubit.get(context).formullist.length),
          )

        ],


      ),



    );

  });
}}
