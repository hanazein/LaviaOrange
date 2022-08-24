import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
   DefaultText({required this.TextSt});
String TextSt;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(left: 10,top: 60),
      child: Text(TextSt,style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),

    );
  }
}
