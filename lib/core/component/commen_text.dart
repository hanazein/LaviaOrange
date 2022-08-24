import 'package:flutter/material.dart';

class CommenAppText extends StatelessWidget {
   CommenAppText({required this.font_size1,required this.font_size2,required this.imgWidth});
double font_size1;
  double font_size2;
  double imgWidth;

  @override

  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text("La",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: font_size1,
                  fontFamily: 'Meddon',
                  fontWeight: FontWeight.w400)),
        ),
        Container(
            width: imgWidth, child: Image.asset("assets/images/img.png")),
        Container(
          child: Text("Via",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: font_size2,
                  fontFamily: 'Meddon',
                  fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
