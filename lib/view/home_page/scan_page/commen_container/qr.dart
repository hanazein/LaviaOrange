


import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_orange/core/style/app_color/color.dart';
import 'package:hakathon_orange/cubit/main/main_cubit.dart';
import 'package:hakathon_orange/models/PlantsidModel.dart';
import 'package:hakathon_orange/view/home_page/scan_page/scan_imp.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../core/utiles/navigation_utality/navigation_utiles.dart';
import '../../../../cubit/main/main_state.dart';

class Qrr extends StatefulWidget {


  @override
  State<Qrr> createState() => _QrrState();
}

class _QrrState extends State<Qrr> {
  final qrKey=GlobalKey(debugLabel: 'QR');
  QRViewController?controller;
  Barcode?barcode;
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  @override
  void reassemble()async {
   if(Platform.isAndroid){
     await controller!.pauseCamera();
   }
   controller!.resumeCamera();
    super.reassemble();
  }
  Widget build(BuildContext context)=>SafeArea(child:
   BlocConsumer<MainCubit, MainState>(
  listener: (context, state) {},
  builder: (context, state) {

    return Scaffold(
      body: Stack(children: <Widget>[
        buildQrView(context),
        Positioned(child: buildResult(), bottom: 18,),
        Positioned(bottom: 80,
          child:
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "SNAKE PLANT (SANSEVIERIA)",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Native to southern Africa",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CircleAvatar(
                      minRadius: 10,
                      backgroundColor: kSecColor,
                      child: IconButton(
                          onPressed: () {
                            MainCubit.get(context).GetPlantsId(
                                plantId: "${barcode!.code}");
                            NavigationUtils.navigateTo(context: context,
                                destinationScreen: ScanImp( ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                          )))
                ],
              ),
            ),
          ),),

      ],),
    );
  }));
  Widget buildResult()=>
      Container(
        width: 350,
        height: 40,
        decoration: BoxDecoration(border: Border.all(color: Colors.greenAccent)),
        child:
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
    barcode!=null?'Result:${describeEnum(barcode!.format)} Data:"${barcode!.code}"':'Scan a Code!',
    maxLines: 3,
            style: TextStyle(color: Colors.white),
  ),
        ),
      );

  Widget buildQrView(BuildContext context)=>QRView(key: qrKey, onQRViewCreated: onQRViewCreated,overlay:QrScannerOverlayShape(
    cutOutSize: MediaQuery.of(context).size.width*0.8,
    borderWidth: 10,
    borderRadius: 10,
  ) ,);

  Future<void> onQRViewCreated(QRViewController controller)async {
    setState(()=>this.controller=controller );
controller.scannedDataStream.listen((barcode) =>setState(()=>this.barcode=barcode) );
  }
}
