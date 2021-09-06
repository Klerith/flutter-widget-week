import 'dart:math';

import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  late final AnimationController controller;
  // late final Animation<double> movingTop;
  late final Animation rotation;

  @override
  void initState() { 
    super.initState();
    
    controller = AnimationController(vsync: this, duration: Duration( seconds: 3 ));

    rotation = Tween( begin: 0.0, end: pi ).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceOut )
    );

    // movingTop = Tween<double>( begin: 0, end: 100 )
    //   .animate( CurvedAnimation(parent: controller, curve: Curves.bounceOut ) );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          child: Square(),
          builder: (context, child) {
            return Transform.rotate(
              angle: rotation.value,
              child: child,
            );
          },
        ),
     ),

     floatingActionButton: FloatingActionButton(
       child: Icon( Icons.play_arrow_outlined ),
       onPressed: () {

          // controller.reset();
          controller.forward().whenCompleteOrCancel(() {
              // controller.reset();
          });
       }
     ),
   );
  }
}



class Square extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,      
      width: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue,
            Colors.pink
          ]
        )
      ),
    );
  }
}

