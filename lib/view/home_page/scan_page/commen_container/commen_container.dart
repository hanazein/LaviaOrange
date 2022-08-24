import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Commen extends StatelessWidget {
   Commen({required this.IconP});
String IconP;

  @override
  Widget build(BuildContext context) {

    return
      Row(
      children: [
      Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.black.withOpacity(0.7



          ),
        ),
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          ImageIcon(AssetImage(IconP,),color: Colors.white.withOpacity(1),),
        )
      ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "78%",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(1),
                  fontWeight: FontWeight.bold
                    ),
              ),
              Text(
                "Sun light",
                style: TextStyle(fontSize: 16, color: Colors.white,),
              )
            ],
          ),
        )
      ],
    );
  }
}

