import 'package:fitgenie_project/HiveDatabase.dart';
import 'package:flutter/cupertino.dart';

import 'workout.dart';
import 'exercise.dart';

class WorkoutData extends ChangeNotifier{
final db = HiveDatabase();
  /*
  WORKOUT DATA STRUCTURE
  -This overall list will contain the different workouts,
  - Each workout will have a name and list of exercises.
   */
  List<Workout> workoutList = [
    Workout(
        name: 'Push Day',
        exercises: [Exercise(
            name: 'Chest Press',
            weight: '25',
            sets: '3',
            reps: '12',
        )
      ],
    ),
    Workout(
      name: 'Pull Day',
      exercises: [Exercise(
        name: 'Bicep Curls',
        weight: '15',
        sets: '3',
        reps: '12',
      )
      ],
    ),
  ];
  // if there are workouts already in database, then get the workoutList
  void initializeWorkoutList(){
    if(db.previousDataExists()){
      workoutList = db.readFromDatabase();
      //if not, use default workouts
    }else{
      db.SaveToDatabase(workoutList);
    }
  }
  //get the list of workout
List<Workout> getWorkoutList(){
  return workoutList;
}
//get the length of a given exercise
  int numberOfExercisesInWorkout(String workoutName){
  Workout relevantWorkout = getRelevantWorkout(workoutName);
  return relevantWorkout.exercises.length;
  }

//add a workout
void addWorkout(String name){
  workoutList.add(Workout(name: name, exercises:[]));
  notifyListeners();

  db.SaveToDatabase(workoutList);
}
//add a exercise to the workout
void addExercise(String workoutName, String exerciseName, String weight, String sets, String reps){
  //find the relevant workout
  Workout relevantWorkout = getRelevantWorkout(workoutName);
  relevantWorkout.exercises.add(
      Exercise(
          name: exerciseName,
          weight: weight,
          sets: sets,
          reps: reps
      ),
  );
  notifyListeners();
  db.SaveToDatabase(workoutList);
}
//check off exercise
void checkOffExercise(String workoutName, String exerciseName){
  Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);
  // check off boolean to show user completed the exercise
  relevantExercise.isCompleted = !relevantExercise.isCompleted;
  notifyListeners();
  db.SaveToDatabase(workoutList);
}

// return relevant workout name ,  given a workout name
Workout getRelevantWorkout(String workoutName){
  Workout relevantWorkout =
  workoutList.firstWhere((workout) => workout.name == workoutName);

  return relevantWorkout;
}
// return relevant exercise name ,  given a workout name + exercise name
Exercise getRelevantExercise(String workoutName, String exerciseName){
  //find relevant workout first
  Workout relevantWorkout = getRelevantWorkout(workoutName);

  //find relevant exercise in the workout
  Exercise relevantExercise =
      relevantWorkout.exercises.firstWhere((exercise) => exercise.name == exerciseName);
  return relevantExercise;

}
}