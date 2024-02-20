import 'package:flutter/material.dart';
import 'package:gymm_rat/exercises/triceps/Single-arm_cable_kick-back.dart';
import 'package:gymm_rat/exercises/triceps/close-grip_bench_press.dart';
import 'package:gymm_rat/exercises/triceps/diamond_pushup.dart';
import 'package:gymm_rat/exercises/triceps/cable_pushdown.dart';
import 'package:gymm_rat/exercises/triceps/overhead_triceps.dart';
import 'package:gymm_rat/exercises/triceps/rope_pushdown.dart';
import 'package:gymm_rat/exercises/triceps/skull_crusher.dart';
import 'package:gymm_rat/exercises/triceps/standing_overhead_cable_triceps_extension.dart';
import 'package:gymm_rat/exercises/triceps/triceps_stretch.dart';

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

// TricepsWorkout class remains the same
class TricepsWorkout extends StatelessWidget {
  const TricepsWorkout({Key? key}) : super(key: key);

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
                  'Triceps Workout', // Updated text
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
              image: 'images/chest.png',
              title: 'Triceps Stretch',
              targetScreen: WorkoutTricepsStretchDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/triceps/close_grip_bench_press.png',
              title: 'Close-grip Bench Press',
              targetScreen: WorkoutCloseGripBenchPressDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/triceps/skull_crusher.png',
              title: 'Skull Crusher (Triceps Extension)',
              targetScreen: WorkoutSkullCrusherDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/triceps/overhead_triceps_extension.png',
              title: 'Overhead Triceps Extension',
              targetScreen: WorkoutOverHeadDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/triceps/cable_machine.png',
              title: 'Cable Push-down',
              targetScreen: WorkoutCableMachineDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/triceps/standing_overhead_cable_extension.png',
              title: 'Standing Overhead Cable Triceps Extension',
              targetScreen: WorkoutStandingOverheadCableTricepsExtensionDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/triceps/diamond_pushup.png',
              title: 'Diamond Pushup',
              targetScreen: WorkoutDiamondPushupDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/triceps/rope_pushdown.png',
              title: 'Rope Pushdown',
              targetScreen: WorkoutRopePushDownDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/triceps/single_arm_cable_kick_back.png',
              title: 'Single-Arm Cable Kick-Back',
              targetScreen: WorkoutSingleArmCableKickBackDetails(), // Provide the target screen widget
            ),
            // Add other WorkoutListItem widgets here
          ],
        ),
      ),
    );
  }
}
