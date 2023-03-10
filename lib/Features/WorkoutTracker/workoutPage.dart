import 'package:fitgenie_project/Features/WorkoutTracker/exerciseTile.dart';
import 'package:fitgenie_project/Features/WorkoutTracker/workoutData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutPage extends StatefulWidget {
  final String workoutName;
  WorkoutPage({required this.workoutName});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  //when checkbox was tapped
  void onCheckboxChanged(String workoutName, String exerciseName){
    Provider.of(context, listen: false).checkOffExercise(workoutName, exerciseName);
  }
  //text controllers
  final exerciseNameController = TextEditingController();
  final weightController = TextEditingController();
  final setsController = TextEditingController();
  final repsController = TextEditingController();

  //create a new exercise
  void createNewExercise(){
    showDialog(context: context,
        builder: (context)=> AlertDialog(
          title: Text('Add new exercise'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //exercise name
            TextField(
                controller: exerciseNameController,
                decoration: InputDecoration(
                  hintText: 'eg: Bench Press',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,


                      )
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              ),
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  hintText: 'Kgs',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      )
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              ),
              TextField(
                controller: setsController,
                decoration: InputDecoration(
                  hintText: 'Sets',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      )
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              ),
              TextField(
                controller: repsController,
                decoration: InputDecoration(
                  hintText: 'Reps',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      )
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              ),
            ],
          ),
          actions: [
            MaterialButton(
                child: Text('Create'),
                onPressed: Create
            ),
            MaterialButton(
                child: Text('Cancel'),
                onPressed: Cancel
            ),
          ],
        )
    );
  }
  void Create(){
    //get exercise name from text controller
    String newWorkoutName = exerciseNameController.text;
    String weight = weightController.text;
    String reps = repsController.text;
    String sets = setsController.text;
    //add workout to workoutdata list in workoutData.dart
    Provider.of<WorkoutData>(context, listen: false).addExercise(
        widget.workoutName,
      newWorkoutName,
      weight,
      reps,
      sets,
    );
    //pop dialogue box
    Navigator.pop(context);
    Clear();
  }
  void Cancel(){
    Navigator.pop(context);
  }
  void Clear(){
    exerciseNameController.clear();
    weightController.clear();
    setsController.clear();
    repsController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
        builder: (context, value, child)=>Scaffold(
          appBar: AppBar(
            title: Text(widget.workoutName),
            backgroundColor: Colors.black,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: createNewExercise,
            backgroundColor: Colors.black,
          ),
          body: ListView.builder(
              itemCount: value.numberOfExercisesInWorkout(widget.workoutName),
              itemBuilder: (context, index)=> ExerciseTile(
                  sets:  value.getRelevantWorkout(widget.workoutName).exercises[index].sets,
                  exerciseName: value.getRelevantWorkout(widget.workoutName).exercises[index].name,
                  reps:  value.getRelevantWorkout(widget.workoutName).exercises[index].reps,
                  weight: value.getRelevantWorkout(widget.workoutName).exercises[index].weight,
                isCompleted:  value.getRelevantWorkout(widget.workoutName).exercises[index].isCompleted,
                onCheckboxChanged: (val)=>
                    onCheckboxChanged(
                        widget.workoutName,
                        value.getRelevantWorkout(widget.workoutName).exercises[index].name
                    ),
              )
          ),
        ),
        );
  }
}
