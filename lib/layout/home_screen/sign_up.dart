

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hakathon_orange/view/home_page/homepage.dart';

import '../../core/style/app_color/color.dart';
import '../../core/utiles/navigation_utality/navigation_utiles.dart';
import '../../cubit/main/main_cubit.dart';
import '../../cubit/main/main_state.dart';


class SignUp extends StatelessWidget {
  var form = GlobalKey<FormState>();
  TextEditingController tt = TextEditingController();

  TextEditingController uu = TextEditingController();

  TextEditingController ii = TextEditingController();

  TextEditingController mm = TextEditingController();

  TextEditingController pp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
      if(state is SignSuccessState){
        if(state.signModel!=null){
          NavigationUtils.navigateAndClearStack(context: context, destinationScreen: HomePage());
        }else{
        }
      }
    },
    builder: (context, state) {
    return 
      SingleChildScrollView(
        child: Form(
          key: form,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 70),
                      child: Text(
                        "First Name ",
                        style: TextStyle(color: Color(0xff6F6F6F)),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 150,

                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: tt,
                        keyboardType: TextInputType.text,
                        cursorHeight: 1,
// obscureText: true,
                        cursorColor: Colors.black,
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return "can't be empty";
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
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 20,
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(right: 70),
                      child: Text(
                        "Last Name ",
                        style: TextStyle(color: Color(0xff6F6F6F)),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      width: 150,
                      child:
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: uu,
                        keyboardType: TextInputType.text,
                        cursorHeight: 1,
                        cursorColor: Colors.black,
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return "can't be empty";
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
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                            )),
                      ),
                    ),
                  ],
                ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  padding: EdgeInsets.only(right: 260),
                  child: Text(
                    "Email ",
                    style: TextStyle(color: Color(0xff6F6F6F)),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: 320,
                  child: TextFormField(
                textInputAction: TextInputAction.done,
                controller: ii,
                keyboardType: TextInputType.emailAddress,
                cursorHeight: 1,
                cursorColor: Colors.black,
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return "can't be empty";
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
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  padding: EdgeInsets.only(right: 240),
                  child: Text(
                    "Password ",
                    style: TextStyle(color: Color(0xff6F6F6F)),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: 320,
                  child: TextFormField(
                textInputAction: TextInputAction.done,
                controller: mm,
                keyboardType: TextInputType.visiblePassword,
                cursorHeight: 1,
                cursorColor: Colors.black,

                validator: (String? val) {
                  if (val!.isEmpty&& val.length>10) {
                    return "can't be small";
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
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  padding: EdgeInsets.only(right: 240),
                  child: Text(
                    "Password ",
                    style: TextStyle(color: Color(0xff6F6F6F)),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: 320,
                  child: TextFormField(
                textInputAction: TextInputAction.done,
                controller: pp,
                keyboardType: TextInputType.visiblePassword,
                cursorHeight: 1,
                cursorColor: Colors.black,

                validator: (String? val) {
                  if (val!.isEmpty) {
                    return "can't be empty";
                  }
                  if (val != mm.text) {
                    return 'Not Match';
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
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                MaterialButton(
                  onPressed: () {
                    if (form.currentState!.validate()) {
                      MainCubit.get(context).SignUp(email: ii.text, password: mm.text, firstName: tt.text, lastName: uu.text);
                      //  NavigationUtils.navigateTo(context: context, destinationScreen: HomePage());
                    }
                }
    ,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
                  minWidth: 330,
                  height: 50,
                  color: kSecColor,
                  child: const Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
                  ),
                ),
          ]))),
      );
  });
}}
