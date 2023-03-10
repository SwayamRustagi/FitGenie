import 'package:flutter/material.dart';
import 'package:fitgenie_project/Features/WaterIntake/waterIntakeScreen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WaterMeter extends StatelessWidget {
  const WaterMeter({
    super.key,
    required double waterIntake,
    required double goal,
  }) : _waterIntake = waterIntake, _goal = goal;

  final double _waterIntake;
  final double _goal;


  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 85.0,
      lineWidth: 10.0,
      percent: _waterIntake / _goal,
      center: Text(
        '${_waterIntake.toInt()} / ${_goal.toInt()} ',
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      progressColor: Colors.blue[900],
    );
  }
}