import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/cubit/main/main_cubit.dart';

import '../../../core/style/app_color/color.dart';
import '../../../cubit/main/main_state.dart';
class EditingEmail extends StatelessWidget {
  TextEditingController tt = TextEditingController();

  TextEditingController uu = TextEditingController();

  TextEditingController ii = TextEditingController();

  TextEditingController mm = TextEditingController();

  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
    builder: (context, state) {
    return  Scaffold(
      body:
      Form(
        key: formkey,
        child:
        SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Container(
                width: 900,
                padding: EdgeInsets.only(
                  left: 220,
                ),
                child: Image.asset(
                  "assets/images/img_1.png",
                  scale: 0.5,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                height: 100.h,
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
                                borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
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
                        child: TextFormField(
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
                  "Address ",
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
                height: 30.h,
              ),
              MaterialButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    MainCubit.get(context).UpdateUser(
                      email: ii.text,
                      address: "migjjjnn",
                      firstName: tt.text,
                      lastName: uu.text,
                    );
                    //  NavigationUtils.navigateTo(context: context, destinationScreen: HomePage());
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                minWidth: 330,
                height: 50,
                color: kSecColor,
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
          ),
        ),
      ),
    );

  });
}}
