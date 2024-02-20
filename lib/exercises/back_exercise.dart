import 'package:flutter/material.dart';
import 'package:gymm_rat/exercises/back/Deadlift.dart';
import 'package:gymm_rat/exercises/back/T-bar_row.dart';
import 'package:gymm_rat/exercises/back/back_extension.dart';
import 'package:gymm_rat/exercises/back/bent_over_row.dart';
import 'package:gymm_rat/exercises/back/chest_supported_row.dart';
import 'package:gymm_rat/exercises/back/chin_up.dart';
import 'package:gymm_rat/exercises/back/inverted_row.dart';
import 'package:gymm_rat/exercises/back/lat_pull-down.dart';
import 'package:gymm_rat/exercises/back/pull_up.dart';
import 'package:gymm_rat/exercises/back/seated_row.dart';
import 'package:gymm_rat/exercises/back/single_arm_dumbbell_row.dart';

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

// Define WorkoutDetails widget
class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate 90% of the screen height
    double screenHeight = MediaQuery.of(context).size.height;
    double desiredHeight = screenHeight * 0.8;

    return Container(
      height: desiredHeight, // Set height to cover 90% of the screen
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: const Center(
        child: Text(
          'Workout Details',
          style: TextStyle(fontSize: 24.0, color: Colors.black), // Changed text color to black
        ),
      ),
    );
  }
}

// BackWorkout class remains the same
class BackWorkout extends StatelessWidget {
  const BackWorkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Set preferred size of the AppBar
        child: AppBar(
          backgroundColor: Colors.grey, // Changed background color to black
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
                  'Back Workout', // Updated text
                  style: TextStyle(color: Colors.white, fontSize: 20.0), // Decreased font size
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity, // Ensure the container fills the entire width
        color: Colors.grey, // Changed background color to black
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: const [
            SizedBox(height: 10),
            WorkoutListItem(
              image: 'images/back/deadlift.png',
              title: 'Deadlift',
              targetScreen: WorkoutDeadliftDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/back/bent_over_row.png',
              title: 'Bent-Over Row',
              targetScreen: WorkoutBentOverRowsDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/back/pull-up.png',
              title: 'Pull-Up',
              targetScreen: WorkoutPullUpDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/back/chin-up.png',
              title: 'Chin-up',
              targetScreen: WorkoutChinUpDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/back/seated_row.png',
              title: 'Seated Row',
              targetScreen: WorkoutSeatedRowDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/back/lat_pull_down.png',
              title: 'Lat Pull-Down',
              targetScreen: WorkoutLatPullDownDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/back/single_arm_dumbbell_row.png',
              title: 'Single-Arm Dumbbell Row',
              targetScreen: WorkoutSingleArmDumbbellRowDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/back/chest_supported_row.png',
              title: 'Chest-Supported Row',
              targetScreen: WorkoutChestSupportedRowsDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/back/t-bar_row.png',
              title: 'T-Bar Row',
              targetScreen: WorkoutTBarRowsDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/back/inverted_row.png',
              title: 'Inverted Row',
              targetScreen: WorkoutInvertedRowsDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/back/back_extension.png',
              title: 'Back Extension',
              targetScreen: WorkoutBackExtensionDetails(), // Provide the target screen widget
            ),
            // Add other WorkoutListItem widgets here
          ],
        ),
      ),
    );
  }
}

