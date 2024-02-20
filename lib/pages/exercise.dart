import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:gymm_rat/exercises/abs_exercise.dart';
import 'package:gymm_rat/exercises/back_exercise.dart';
import 'package:gymm_rat/exercises/biceps_exercise.dart';
import 'package:gymm_rat/exercises/chest_exercise.dart';
import 'package:gymm_rat/exercises/legs_exercise.dart';
import 'package:gymm_rat/exercises/shoulder_exercise.dart';
import 'package:gymm_rat/exercises/triceps_exercise.dart';

class Exercise extends StatelessWidget {
  Exercise({super.key, Key});

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          color: Colors.grey,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),

        ListView(
          children: const [
            SizedBox(height: 20,),
            ExerciseListItem(
              image: 'images/chest.png',
              title: 'Chest Workout',
              subtitle: '12 exercises',
              description: 'Incline Bench Press'
                  '\nDecline Bench Press'
                  '\nBarbell Bench Press',
              targetScreen: ChestWorkout(),
            ),
            ExerciseListItem(
              image: 'images/back.png',
              title: 'Back Workout',
              subtitle: '11 exercises',
              description: 'Deadlift\nBent-Over Row\nPull-Up',
              targetScreen: BackWorkout(),
            ),
            ExerciseListItem(
              image: 'images/biceps.png',
              title: 'Biceps Workout',
              subtitle: '10 exercises',
              description: 'Hammer Curl\nReverse Curl\nWide-Grip Curl',
              targetScreen: BicepsWorkout(),
            ),
            ExerciseListItem(
              image: 'images/triceps.png',
              title: 'Triceps Workout',
              subtitle: '9 exercises',
              description: 'Triceps Stretch\nClose-grip Bench Press\nSkull Crusher',
              targetScreen: TricepsWorkout(),
            ),
            ExerciseListItem(
              image: 'images/shoulder.png',
              title: 'Shoulder Workout',
              subtitle: '10 exercises',
              description: 'Face pull\nHigh pull\nClean and press',
              targetScreen: ShoulderWorkout(),
            ),
            ExerciseListItem(
              image: 'images/abs.png',
              title: 'Abs Workout',
              subtitle: '10 exercises',
              description: 'Decline crunch\nIncline situp\nPlank',
              targetScreen: AbsWorkout(),
            ),
            ExerciseListItem(
              image: 'images/legs.png',
              title: 'Legs Workout',
              subtitle: '10 exercises',
              description: 'Barbell Squat\nLeg press\nWalking Lunge',
              targetScreen: LegsWorkout(),
            ),
          ],
        ),
      ],
    );
  }
}

class ExerciseListItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final Widget? targetScreen; // Target screen to navigate to

  const ExerciseListItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    this.targetScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // If targetScreen is provided, navigate to it
            if (targetScreen != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => targetScreen!),
              );
            }
          },
          child: Container(
            width: 410, // Decreased width
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), // Rounded corners
              border: Border.all(
                color: Colors.white30, // Border color
                width: 2.0, // Border width
              ),
              color: Colors.white, // Background color
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                  leading: Image.asset(
                    image,
                    width: 130,
                    height: 130,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 23.0,
                          color: Colors.black, // Text color set to black
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54, // Subtitle text color
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // If targetScreen is provided, navigate to it
                    if (targetScreen != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => targetScreen!),
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          description,
                          style: const TextStyle(
                            fontSize: 17.0,
                            color: Colors.black87, // Text color set to black
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Add some space between the description and additional text
                      const Text(
                        '4 x 10\n'
                        '4 x 10\n'
                        '4 x 10\n',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black87, // Example additional text color
                        ),
                      ),
                      const Text(
                        '\n\n\n\nView all',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.blue, // Set "View all" text color to blue
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20.0), // Adding spacing below the Divider
      ],
    );
  }
}

class Back extends StatelessWidget {
  const Back({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back Exercise'),
      ),
      body: const Center(
        child: Text(
          'Back Exercise Screen',
          style: TextStyle(
            color: Colors.black, // Text color set to black
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Exercise(),
    );
  }
}
