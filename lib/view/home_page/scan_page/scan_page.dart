// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hakathon_orange/core/utiles/navigation_utality/navigation_utiles.dart';
// import 'package:hakathon_orange/view/home_page/scan_page/scan_imp.dart';
// import 'package:qr_flutter/qr_flutter.dart';
//
//
// import '../../../core/style/app_color/color.dart';
//
// class ScanPage extends StatefulWidget {
//
//   @override
//   State<ScanPage> createState() => _ScanPageState();
// }
//
// class _ScanPageState extends State<ScanPage> {
// TextEditingController controllerText=TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:
//         Stack(children: [
//       Padding(
//         padding: const EdgeInsets.only(right: 0, left: 0, top: 0, bottom: 0),
//         child: Image.asset(
//           "assets/images/img_13.png",
//           fit: BoxFit.cover,
//           height: double.infinity,
//           width: double.infinity,
//           alignment: Alignment.center,
//         ),
//       ),
//     Padding(
//       padding: const EdgeInsets.only(top: 100,left: 40,right: 40),
//       child:
//       TextFormField(
//       textInputAction: TextInputAction.search,
//       style: const TextStyle(
//       color: Colors.black,
//       ),
//       controller: controllerText,
//       keyboardType: TextInputType.text,
//       //   cursorHeight: 0,
// // obscureText: true,
//       cursorColor: Colors.black,
//         decoration: InputDecoration(
//       // hintText: "enter your city",
//       label: const Text('search'),
//       labelStyle: const TextStyle(
//       color: Colors.green,
//       ),
//       suffixIcon:IconButton(onPressed:(){setState(() {});}, icon: Icon(Icons.align_horizontal_right)),
//       errorBorder: const OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.greenAccent, width: 0.0,),
//       ),
//       focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.greenAccent),
//       borderRadius: BorderRadius.circular(13),
//       ),
//       enabledBorder: OutlineInputBorder(
//       borderSide:  BorderSide(color: Colors.greenAccent),
//       borderRadius: BorderRadius.circular(13),
//       )),
//       ),
//     ),
//      Padding(
//        padding: const EdgeInsets.only(top: 250,left: 90),
//        child: QrImage(data:controllerText.text,
//          size: 200,
//          backgroundColor: Colors.white,
//
//        ),
//      ),
//       Padding(
//         padding: const EdgeInsets.only(bottom: 30, left: 30, top: 600),
//         child: Container(
//           width: 300,
//           height: 70,
//           decoration: BoxDecoration(
//               color: Colors.white54,
//               borderRadius: BorderRadius.circular(12)),
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       "SNAKE PLANT (SANSEVIERIA)",
//                       style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 4.h,
//                     ),
//                     Text(
//                       "Native to southern Africa",
//                       style: TextStyle(fontSize: 14, color: Colors.black),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 10.w,
//               ),
//               CircleAvatar(
//                   minRadius: 10,
//                   backgroundColor: kSecColor,
//                   child: IconButton(
//                       onPressed: () { NavigationUtils.navigateTo(context: context, destinationScreen: ScanImp());},
//                       icon: Icon(
//                         Icons.arrow_forward_rounded,
//                         color: Colors.white,
//                       )))
//             ],
//           ),
//         ),
//       )
//     ]));
//   }
// }
