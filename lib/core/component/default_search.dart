import 'package:flutter/material.dart';

import '../../cubit/main/main_cubit.dart';

class DefaultSearch extends StatefulWidget {




  @override
  State<DefaultSearch> createState() => _DefaultSearchState();
}

class _DefaultSearchState extends State<DefaultSearch> {
  TextEditingController uu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
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
        MainCubit.get(context).search(val);
      },
      onChanged: (String? val) {
        MainCubit.get(context).search(val!);
      },

      decoration: InputDecoration(
        // hintText: "enter your city",
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
    );


  }
}

