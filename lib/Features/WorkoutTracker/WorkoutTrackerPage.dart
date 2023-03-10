import 'package:flutter/material.dart';
import 'package:fitgenie_project/Features/WorkoutTracker/workoutData.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:fitgenie_project/Features/WorkoutTracker/workoutPage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WorkoutTrackerPage extends StatefulWidget {
  static String id = 'workouttracker_page';
  const WorkoutTrackerPage({Key? key}) : super(key: key);

  @override
  State<WorkoutTrackerPage> createState() => _WorkoutTrackerPageState();
}

class _WorkoutTrackerPageState extends State<WorkoutTrackerPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<WorkoutData>(context, listen: false).initializeWorkoutList();
  }

  final newWorkoutNameController = TextEditingController();

  void createNewWorkout(){
    showDialog(context: context,
        builder: (context)=> AlertDialog(
          title: Text('Create new workout'),
          content: TextField(
            controller: newWorkoutNameController,
            decoration: InputDecoration(
              hintText: 'eg: Push Day',
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
        ),
    );
  }
  //go to workout page
  void goToWorkoutPage(String workoutName){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> WorkoutPage(
      workoutName: workoutName,
    ),));
  }
  void Create(){
    //get workout name from text controller
    String newWorkoutName = newWorkoutNameController.text;
    //add workout to workoutdata list in workoutData.dart
    Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutName);
    //pop dialogue box
    Navigator.pop(context);
    Clear();
  }
  void Cancel(){
    Navigator.pop(context);
  }
  void Clear(){
    newWorkoutNameController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return  Consumer<WorkoutData>(builder: (context,value,child){
      return Scaffold(
          appBar: AppBar(
            title: Text('Workout Tracker'),
            backgroundColor: Colors.black,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: createNewWorkout,
            child: Icon(Icons.add),
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
                itemCount: value.getWorkoutList().length,
                itemBuilder: (context, index)=> Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets. only(left:10, bottom: 7, right:50, top:10),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black87,
      ),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: StretchMotion(),
                      children: [
                        SlidableAction(
                            onPressed:((context){
                              null;
                            }),
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        )
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                          value.getWorkoutList()[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                      color: Colors.white,
                      onPressed: (){
                        goToWorkoutPage(value.getWorkoutList()[index].name);
                      },
                      ),
                    ),
                  ),
                )),
          )
      );
    });
  }
}
