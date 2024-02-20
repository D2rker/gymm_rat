import 'package:flutter/material.dart';
import 'package:gymm_rat/exercises/abs/flutter_kick.dart';
import 'package:gymm_rat/exercises/abs/hanging_leg_raise.dart';
import 'package:gymm_rat/exercises/abs/heel_touch.dart';
import 'package:gymm_rat/exercises/abs/incline_situp.dart';
import 'package:gymm_rat/exercises/abs/russian_twist.dart';
import 'package:gymm_rat/exercises/abs/side_plank.dart';
import 'abs/Crunch.dart';
import 'abs/Decline_crunch.dart';
import 'abs/dip_leg_raise_combo.dart';
import 'abs/plank.dart';

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

// AbsWorkout class remains the same
class AbsWorkout extends StatelessWidget {
  const AbsWorkout({Key? key}) : super(key: key);

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
                  'Abs Workout', // Updated text
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
              image: 'images/abs/decline_crunch.png',
              title: 'Decline Crunch',
              targetScreen: WorkoutDeclineCrunchDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/abs/russion_twist.png',
              title: 'Russian Twist',
              targetScreen: WorkoutRussianTwistDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/abs/dip-leg_raise_combo.png',
              title: 'Dip/Leg Raise Combo',
              targetScreen: WorkoutDipLegRaiseComboDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/abs/flutter_kick.png',
              title: 'Flutter Kick',
              targetScreen: WorkoutFlutterKickDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/abs/incline_situp.png',
              title: 'Incline Situp',
              targetScreen: WorkoutInclineSitUpDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/abs/side_plank.png',
              title: 'side plank',
              targetScreen: WorkoutSidePlankDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/abs/plank.png',
              title: 'Plank',
              targetScreen: WorkoutPlankDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/abs/heel_touch.png',
              title: 'Heel Touch',
              targetScreen: WorkoutHealTouchDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/abs/crunch.png',
              title: 'Crunch',
              targetScreen: WorkoutCrunchDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/abs/hanging_leg_raise.png',
              title: 'Hanging Leg Raise',
              targetScreen: WorkoutHangingLegRaiseDetails(), // Provide the target screen widget
            ),
            // Add other WorkoutListItem widgets here
          ],
        ),
      ),
    );
  }
}
