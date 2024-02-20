import 'package:flutter/material.dart';

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
          ListTile(
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
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0), // Adding space between title and "4 Sets x 8 reps"
                const Text(
                  '4 Sets x 10 reps',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0), // Adding spacing between ListTile and Divider
          const Divider(
            color: Colors.black,
            thickness: 1.0,
            height: 0,
            indent: 20.0,
            endIndent: 20.0,
          ),
          const SizedBox(height: 15.0), // Adding spacing below the Divider
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
        preferredSize: const Size.fromHeight(80.0), // Set preferred size of the AppBar
        child: AppBar(
          backgroundColor: Colors.grey,
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
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: const [
            SizedBox(height: 10),
            WorkoutListItem(
              image: 'images/chest.png',
              title: 'Squat',
              targetScreen: WorkoutDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/chest.png',
              title: 'Barbell Squat',
              targetScreen: WorkoutDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/chest.png',
              title: 'Leg Press',
              targetScreen: WorkoutDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/back.png',
              title: 'Bodyweight Calf Raise',
              targetScreen: WorkoutDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/biceps.png',
              title: 'Walking Lunge',
              targetScreen: WorkoutDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/triceps.png',
              title: 'Barbell Hip Thrust',
              targetScreen: WorkoutDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/shoulder.png',
              title: 'Goblet Squat',
              targetScreen: WorkoutDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/abs.png',
              title: 'Romanian deadlift',
              targetScreen: WorkoutDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/abs.png',
              title: 'Lateral lunge',
              targetScreen: WorkoutDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/abs.png',
              title: 'Leg curl',
              targetScreen: WorkoutDetails(), // Provide the target screen widget
            ),
            WorkoutListItem(
              image: 'images/legs.png',
              title: 'Seated Leg curl',
              targetScreen: WorkoutDetails(), // Provide the target screen widget
            ),
            // Add other WorkoutListItem widgets here
          ],
        ),
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
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Legs Workout App',
    home: LegsWorkout(),
  ));
}
