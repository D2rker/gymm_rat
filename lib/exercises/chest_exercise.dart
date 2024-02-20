import 'package:flutter/material.dart';
import 'package:gymm_rat/exercises/chest/decline_bench_press.dart';
import 'package:gymm_rat/exercises/chest/dips.dart';
import 'package:gymm_rat/exercises/chest/dumbbell_bench_press.dart';
import 'package:gymm_rat/exercises/chest/dumbbell_half_fly.dart';
import 'package:gymm_rat/exercises/chest/dumbbell_pull_over.dart';
import 'package:gymm_rat/exercises/chest/incline_bench_press.dart';
import 'package:gymm_rat/exercises/chest/low_cable_crossover.dart';
import 'package:gymm_rat/exercises/chest/seated_chest_fly.dart';
import 'package:gymm_rat/exercises/chest/standing_chest_press.dart';
import 'package:gymm_rat/exercises/chest/barbell_bench_press.dart';
import 'package:gymm_rat/exercises/chest/incline_cable_fly.dart';
import 'package:gymm_rat/exercises/chest/push_up.dart';

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
    );
  }
}


// ChestWorkout class remains the same
class ChestWorkout extends StatelessWidget {
  const ChestWorkout({Key? key}) : super(key: key);

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
                  'Chest Workout', // Updated text
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
              image: 'images/chest/push_up.png',
              title: 'Push-Up',
              targetScreen: WorkoutPushUpDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/chest/seated_chest_fly.png',
              title: 'Seated Chest Fly',
              targetScreen: WorkoutSeatedChestFlyDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/chest/dumbbell_bench_press.png',
              title: 'Dumbbell Bench Press',
              targetScreen: WorkoutDumbbellBenchPressDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/chest/bench_press.png',
              title: 'Barbell Bench Press',
              targetScreen: WorkoutBenchPressDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/chest/incline_bench_press.png',
              title: 'Incline Bench Press',
              targetScreen: WorkoutInclineBenchPressDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/chest/decline_bench_press.png',
              title: 'Decline Bench Press',
              targetScreen: WorkoutDeclineBenchPressDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/chest/standing_chest_press.png',
              title: 'Standing Chest Press',
              targetScreen: WorkoutStandingChestPressDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/chest/dumbbell_pull-over.png',
              title: 'Dumbbell Pull-Over',
              targetScreen: WorkoutDumbbellPullOverDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/chest/dumbbell_half_fly.png',
              title: 'Dumbbell Half Fly',
              targetScreen: WorkoutDumbbellHalfFlyDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/chest/low_cable_cross-over.png',
              title: 'Low-Cable Crossover',
              targetScreen: WorkoutLowCableCrossoverDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/chest/dips.png',
              title: 'Dips',
              targetScreen: WorkoutDipsDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/chest/incline_cable_fly.png',
              title: 'Incline Cable Fly',
              targetScreen: WorkoutInclineCableFlyDetails(), // Provide the target screen widget
            ),
            // Add other WorkoutListItem widgets here
          ],
        ),
      ),
    );
  }
}


