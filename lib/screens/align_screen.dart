import 'package:flutter/material.dart';

class AlignScreen extends StatelessWidget {
   
   @override
   Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
        child: Container(
          width:300,
          height: 300,
          decoration: containerBorder(),
          child: Stack(
            children: [
              Align(
                child: CustomBox( color: Colors.blue,)
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: CustomBox( color: Colors.pinkAccent )
              ),
              Align(
                alignment: Alignment( 0, -0.5),
                child: CustomBox( color: Colors.green )
              ),
              Align(
                alignment: Alignment( 0, 0.5),
                child: CustomBox( color: Colors.green )
              ),
            ],
          )
        ),
      )
   );
   }

   BoxDecoration containerBorder() {
     return BoxDecoration(
          border: Border.all(
            color: Colors.blueAccent,
            width: 2
          )
        );
   }
}


class CustomBox extends StatelessWidget {
  
  final Color color;

  const CustomBox({ this.color = Colors.blue });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: color
    );
  }
}