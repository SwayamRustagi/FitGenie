import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WaterIntakeSystem extends StatefulWidget {
  static String id = 'waterIntake_Screen';
  @override
  _WaterIntakeSystemState createState() => _WaterIntakeSystemState();
}

class _WaterIntakeSystemState extends State<WaterIntakeSystem> {
  double _waterIntake = 0;
  double _goal = 10; // glasses

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Water Intake System'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          WaterMeter(waterIntake: _waterIntake, goal: _goal),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _incrementWaterIntake,
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.add,color: Colors.white,),
                    )),
              ),
              SizedBox(width: 20.0),
              GestureDetector(
                onTap: _decrementWaterIntake,
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.remove,color: Colors.white,),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WaterMeter extends StatelessWidget {
  const WaterMeter({
    super.key,
    required double waterIntake,
    required double goal,
  })  : _waterIntake = waterIntake,
        _goal = goal;

  final double _waterIntake;
  final double _goal;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 200.0,
      lineWidth: 10.0,
      percent: _waterIntake / _goal,
      center: Text(
        '${_waterIntake.toInt()} / ${_goal.toInt()} Glasses',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      progressColor: Colors.blue[900],
    );
  }
}
