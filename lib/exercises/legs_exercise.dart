import 'package:flutter/material.dart';
import 'package:gymm_rat/exercises/legs/bodyweight_calf_raise.dart';
import 'package:gymm_rat/exercises/legs/bulgarian_split_squat.dart';
import 'package:gymm_rat/exercises/legs/goblet_squat.dart';
import 'package:gymm_rat/exercises/legs/leg_extension.dart';
import 'package:gymm_rat/exercises/legs/leg_press_machine.dart';
import 'package:gymm_rat/exercises/legs/lying_leg_curl.dart';
import 'package:gymm_rat/exercises/legs/romanian_deadlift.dart';
import 'package:gymm_rat/exercises/legs/walking_lunge.dart';
import 'legs/Barbell_squat.dart';
import 'legs/squat.dart';

// Define WorkoutListItem widget
class WorkoutListItem extends StatelessWidget {
  final String image;
  final String title;
  final Widget? targetScreen; // Target screen to navigate to

  const WorkoutListItem({
    required this.image,
    required this.title,
    this.targetScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // If targetScreen is provided, show the bottom sheet
        if (targetScreen != null) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // Set to true for covering most of the screen
            backgroundColor: Colors.transparent, // Make the background transparent
            builder: (BuildContext context) {
              return targetScreen!;
            },
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
          );
        }
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              leading: Image.asset(
                image,
                width: 100,
                height: 100,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 23.0,
                      color: Colors.black, // Changed text color to black
                    ),
                  ),
                  const SizedBox(height: 8.0), // Adding space between title and "4 Sets x 8 reps"
                  const Text(
                    '4 Sets x 10 reps',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black, // Changed text color to black
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0), // Adding spacing between ListTile and Divider
        ],
      ),
    );
  }
}


// LegsWorkout class remains the same
class LegsWorkout extends StatelessWidget {
  const LegsWorkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Set preferred size of the AppBar
        child: AppBar(
          backgroundColor: Colors.grey, // Changed background color to grey
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Legs Workout', // Updated text
                  style: TextStyle(color: Colors.white, fontSize: 20.0), // Decreased font size
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity, // Ensure the container fills the entire width
        color: Colors.grey, // Changed background color to grey
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: const [
            SizedBox(height: 10),
            WorkoutListItem(
              image: 'images/legs/squat.png',
              title: 'Squat',
              targetScreen: WorkoutSquatDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/legs/barbell_squat.png',
              title: 'Barbell Squat',
              targetScreen: WorkoutBarbellSquatDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/legs/leg_press.png',
              title: 'Leg Press',
              targetScreen: WorkoutLegPressMachineDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/legs/bodyweight_calf_raise.png',
              title: 'Bodyweight Calf Raise',
              targetScreen: WorkoutBodyweightCalfRaiseDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/legs/walking_lunge.png',
              title: 'Walking Lunge',
              targetScreen: WorkoutWalkingLungeDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/legs/bulgarion_spilit_squat.png',
              title: 'Bulgarian Split Squat',
              targetScreen: WorkoutBulgarianSplitSquatDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/legs/goblet_squat.png',
              title: 'Goblet Squat',
              targetScreen: WorkoutGobletSquatDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/back/deadlift.png',
              title: 'Romanian deadlift',
              targetScreen: WorkoutRomanianDeadliftDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/legs/leg_extension.png',
              title: 'Leg Extension',
              targetScreen: WorkoutLegExtensionDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/legs/lying_leg_curl.png',
              title: 'Lying Leg curl',
              targetScreen: WorkoutLyingLegCurlDetails(), // Provide the target screen widget
            ),
            // Add other WorkoutListItem widgets here
          ],
        ),
      ),
    );
  }
}

