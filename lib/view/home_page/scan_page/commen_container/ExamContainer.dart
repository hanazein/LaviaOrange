import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/app_color/color.dart';

class ExamContainer extends StatelessWidget {
  const ExamContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      Container(
      width: 320,
      height: 60,
      decoration: BoxDecoration(
        border:Border.all(color: kSecColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child:
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child:
        SingleChildScrollView(
          child:
          Row(
            children: [
              Text("The user experience is how the developer feels about a user.",style: TextStyle(color:Colors.black ,fontSize: 10,fontWeight: FontWeight.w500 ),),

              Container(width: 50,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.circle_outlined,color:kSecColor,)))

            ],
          ),
        ),
      ),

    );
  }
}
