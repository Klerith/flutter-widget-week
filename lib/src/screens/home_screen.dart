import 'dart:ui';

import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Center(
              child: Image.network('https://miro.medium.com/max/3200/0*ZdwECz0chT1hOq6Y'),
          ),

          Positioned(
            top: 350,
            left: 20,
            right: 20,
            bottom: 380,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5
                ),
                child: Container(),
              ),
            ),
          ),


          Center(
            child: Text(
              'No blur aquí',
              style: TextStyle( fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )


        ],
      )
      
   );
  }
}