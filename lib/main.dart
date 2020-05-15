import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomeScreen(),
));



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> animationMove;
  double opacity = 1.0;
  bool menuOpen = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    controller.addListener((){
      setState(() {

      });
    });

    animationMove = Tween(begin: 3.1415926, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.1,
          1.0,
          curve: Curves.easeIn,
        ),
        //reverseCurve: Curves.bounceOut,
      ),
    );

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Container(
              color: Colors.grey[800],
            ),

            Transform.rotate(
              angle: - (animationMove.value)/2,
              origin: Offset(-164.5, -356.5),

              child: Container(
                constraints: BoxConstraints.expand(),
                color: Colors.grey[900],
                child: Stack(
                  children: <Widget>[

                    Positioned(
                      left: 20,
                      top: 30,
                      child: IconButton(
                        iconSize: 45,
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.dehaze,
                          color: Colors.white,
                        ),
                        onPressed: (){
                          setState(() {
                            if(!menuOpen){
                              menuOpen = true;
                              controller.forward();
                              opacity = 0.0;
                            }
                            else{
                              menuOpen = false;
                              controller.reverse();
                              opacity = 1.0;
                            }
                          });
                        },
                      ),
                    ),

                    Positioned(
                      top: 110,
                      left: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.account_circle,
                                color: Colors.white,
                                size: 50,
                              ),

                              SizedBox(
                                width: 40,
                              ),

                              Text(
                                "PROFILE",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.assistant_photo,
                                color: Colors.white,
                                size: 50,
                              ),

                              SizedBox(
                                width: 40,
                              ),

                              Text(
                                "FEED",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.accessibility_new,
                                color: Colors.white,
                                size: 50,
                              ),

                              SizedBox(
                                width: 40,
                              ),

                              Text(
                                "ACTIVITY",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 120,
                          ),

                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.settings,
                                color: Colors.white,
                                size: 50,
                              ),

                              SizedBox(
                                width: 40,
                              ),

                              Text(
                                "SETTINGS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      right: 295,
                      top: 200,
                      child: AnimatedOpacity(
                        opacity: opacity,
                        duration: Duration(milliseconds: 500),
                        child: Transform.rotate(
                          angle: pi/2,
                          child: Text(
                            "ACTIVITY",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
