import 'package:fitgenie_project/Components/miniUseButton.dart';
import 'package:fitgenie_project/Features/WaterIntake/waterMeter.dart';
import 'package:flutter/material.dart';
import 'package:fitgenie_project/Components/miniUseButton.dart';

class longReuseableCard extends StatefulWidget {
  longReuseableCard({this.imagepath,
    this.decText,
    this.miniButtonText,
    this.miniButtonColor, this.description,
    this.whenPressed,
    this.imagePath2,
  this.color,
  });
  final String? imagepath;
  final String? decText;
  final String? miniButtonText;
  final Color? miniButtonColor;
  final String? description;
  final VoidCallback? whenPressed;
  final String? imagePath2;
  final Color? color;

  @override
  State<longReuseableCard> createState() => _longReuseableCardState();
}

class _longReuseableCardState extends State<longReuseableCard> {
  double _waterIntake = 0;

  double _goal = 10;
 // glasses
  void _incrementWaterIntake() {
    setState(() {
      _waterIntake += 1;
      if (_waterIntake > _goal) {
        _waterIntake = _goal;
      }
    });
  }

  void _decrementWaterIntake() {
    setState(() {
      _waterIntake -= 1;
      if (_waterIntake < 0) {
        _waterIntake = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.fromLTRB(25, 15, 25, 5),
      child: GestureDetector(
        onTap: widget.whenPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: const Offset(
                      1.0,
                      2.0,
                    ),
                    blurRadius: 3.5,
                    spreadRadius: 1.5,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 2.0,
                    spreadRadius: 1.25,
                  ), //BoxShadow
                ],
              ),
              width: 350,
              padding: EdgeInsets.all(12),
              color: widget.color,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          height: 80,
                          child: Image.asset(widget.imagepath!),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: _incrementWaterIntake,
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue[900]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Icon(Icons.add,color: Colors.white,),
                            )),
                      ),
                      SizedBox(width: 10),
                      Center(
                        child: WaterMeter(
                          goal:_goal,
                          waterIntake: _waterIntake,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: _decrementWaterIntake,
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue[900]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Icon(Icons.remove,color: Colors.white,),
                            )),
                      ),
                    ],
                  ),
                  // SizedBox(height: 10),
                  // Padding(
                  //   padding: EdgeInsets.all(5),
                  //   child: Container(
                  //     height: 30,
                  //     width: 30,
                  //     child: Image.asset(imagePath2!),
                  //   ),
                  // )

                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}
