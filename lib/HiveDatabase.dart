import 'package:fitgenie_project/DateTime/date_time.dart';
import 'package:fitgenie_project/Features/WorkoutTracker/exercise.dart';
import 'package:fitgenie_project/Features/WorkoutTracker/workout.dart';
import 'package:fitgenie_project/Features/WorkoutTracker/workoutData.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase{
  //reference our hive box/ database
  final myBox = Hive.box('workout_database1');

  //check if data is stored, if not, record the start date
bool previousDataExists(){
  if(myBox.isEmpty){
    print("previous No");
    myBox.put("Start Date", todayDateYYYYMMDD());
    return false;
  }else{
    print("previous yes");
    return true;
  }
}
  //return date as yyymmdd
String getStartDate(){
  return myBox.get("Start Date");
}
  //write data
void SaveToDatabase(List<Workout>workouts){
  //convert workout objects into lists of strings to save in hive
  final workoutList = convertObjectToWorkoutList(workouts);
  final exerciseList = convertObjectToExerciseList(workouts);
  /*
  check if any exercises have been done
  we will put a 0 or a 1 for each yyyymmdd date
   */
  if(exerciseCompleted(workouts)){
    myBox.put("Completion Status"+todayDateYYYYMMDD(), 1);
  }else{
  myBox.put("Completion Status"+todayDateYYYYMMDD(), 0);
  }

  //save to hive
  myBox.put("Workouts", workoutList);
  myBox.put("Exercises", exerciseList);
}
  //read data, as a list of workouts
List<Workout>readFromDatabase(){
  List<Workout> mySavedWorkouts = [];

  List<String> workoutNames = myBox.get("Workouts")??[];
  final exerciseDetails = myBox.get("Exercises");
  //create workout Objects
  for(int i = 1;i<workoutNames.length;i++){
    //each workout can have multiple exercises
    List<Exercise> exerciseInEachWorkout = [];

    for(int j=0;j<exerciseDetails[i].length;j++){
      exerciseInEachWorkout.add(
        Exercise(
            name: exerciseDetails[i][j][0],
            weight: exerciseDetails[i][j][1],
            sets: exerciseDetails[i][j][2],
            reps: exerciseDetails[i][j][3],
            isCompleted: exerciseDetails[i][j][4]=="true"? true: false,
      ),
      );
    }
    //create individual workout
    Workout workout = Workout(exercises: exerciseInEachWorkout, name: workoutNames[i]);

    //add individual workout to overall list
    mySavedWorkouts.add(workout);
  }
  return mySavedWorkouts;
}

  //check if completion has been done
  bool exerciseCompleted(List<Workout>workouts){
  //go thru each workout
    for(var workout in workouts){
      //go thru each exercise in each workout
      for(var exercise in workout.exercises){
        if(exercise.isCompleted){
          return true;
        }
      }
    }
    return false;
  }

  //return completion ststus of a given date yyymmdd
int getCompletionStatus(String yyyymmdd){
  int completionStatus = myBox.get("Completion Status_$yyyymmdd") ?? 0;
  return completionStatus;
}
}
//convert workout objects into a list
List<String> convertObjectToWorkoutList(List<Workout>workouts){
  List<String> workoutList = [
    //eg: [push day, pull day]
  ];

  for(int i = 0; i<workouts.length; i++){
    workoutList.add(workouts[i].name);
  }
  return workoutList;
}

//convert exercises of a workout object into a list of strings
List<List<List<String>>> convertObjectToExerciseList(List<Workout>workouts){
  List<List<List<String>>>exerciseList = [
    /*
    [
    Push Day
    [[Chest Press, 25Kg, 3 Sets, 12 reps]],
    Pull Day
    [[Bicep Curls, 15Kg, 3 Sets, 12 reps]],

    ]
     */
  ];
  //go through each workout
  for(int i =0; i<workouts.length;i++){
    //get exercises from each workout
    List<Exercise> exercisesInWorkout = workouts[i].exercises;

    List<String> individualWorkout = [
      // Push Day
      // [[Chest Press, 25Kg, 3 Sets, 12 reps]],
    ];
    // go through each exercise in exercise list
    for(int j=0;j<exercisesInWorkout.length;j++){
      List<String> individualExercise = [
        // [Chest Press, 25Kg, 3 Sets, 12 reps]
      ];
      individualExercise.addAll(
        [
          exercisesInWorkout[j].name,
          exercisesInWorkout[j].weight,
          exercisesInWorkout[j].sets,
          exercisesInWorkout[j].reps,
          exercisesInWorkout[j].isCompleted.toString(),
        ],
      );
      individualWorkout.add(individualExercise as String);
    }
    exerciseList.add(individualWorkout.cast<List<String>>());
  }
  return exerciseList;
}