import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {

  ExerciseTile({
    required this.sets,
    required this.exerciseName,
    required this.reps,
    required this.weight,
    required this.isCompleted,
    required this.onCheckboxChanged,
  });

  final String exerciseName;
  final String weight;
  final String sets;
  final String reps;
  bool isCompleted;
  void Function(bool?)? onCheckboxChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets. only(left:10, bottom: 7, right:50, top:10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black87,
      ),
      child: ListTile(
        title: Text(
          exerciseName,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        subtitle: Row(
          children: [
            Chip(label: Text(
                weight + 'Kg'
            ),
            ),
            SizedBox(width: 10),
            Chip(label: Text(
               sets + ' Sets'
            ),
            ),
            SizedBox(width: 10),
            Chip(label: Text(
                reps + ' reps'
            ),
            ),
          ],
        ),
        trailing: Checkbox(
          focusColor: Colors.white,
          value: isCompleted,
          checkColor: Colors.green,
          onChanged: (value)=> onCheckboxChanged!(value),
        ),
      ),
    );
  }
}
