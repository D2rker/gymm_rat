import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class WorkoutInclineCableFlyDetails extends StatefulWidget {
  const WorkoutInclineCableFlyDetails({Key? key}) : super(key: key);

  @override
  _WorkoutInclineCableFlyDetailsState createState() =>
      _WorkoutInclineCableFlyDetailsState();
}

class _WorkoutInclineCableFlyDetailsState extends State<WorkoutInclineCableFlyDetails> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset(
        'images/chest/incline_cable_fly.mp4');

    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.hasError) {
        print("Error: ${_videoPlayerController.value.errorDescription}");
      }
    });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      allowFullScreen: true,
      aspectRatio: 15 / 08,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.red,
        bufferedColor: Colors.lightGreen,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double desiredHeight = screenHeight * 0.8;

    return Container(
      height: desiredHeight,
      width: MediaQuery.of(context).size.width * 1.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'INSTRUCTIONS',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 200,
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            ),
            const SizedBox(height: 20), // Adding some space between the video and text
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Text(
                    'Incline Cable Fly',
                    style: TextStyle(
                      fontSize: 21.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Colors.grey, // You can adjust the color of the divider as needed
                thickness: 1, // You can adjust the thickness of the divider as needed
              ),
            ),// Adding space between the text
            const SizedBox(height: 8),

            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Text(
                    'FOCUS AREA    ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Chest, Biceps, Shoulder',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Text(
                    'EQUIPMENT      ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Cable machine, Incline bench',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Colors.grey, // You can adjust the color of the divider as needed
                thickness: 1, // You can adjust the thickness of the divider as needed
              ),
            ),// Adding space between the text
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'PREPARATION',
                style: TextStyle(
                  fontSize: 21.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Lie on a bench with feet on the floor. Hold the handles with palms up and extend your arms to the sides.',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Colors.grey, // You can adjust the color of the divider as needed
                thickness: 1, // You can adjust the thickness of the divider as needed
              ),
            ),// Adding space between the text
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'EXECUTION',
                style: TextStyle(
                  fontSize: 21.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Text(
                    '1.    ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Exhale and pull the handles up in an arc motion in front of \nyour chest.',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Text(
                    '2.    ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Squeeze your chest and hold for a count.',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Text(
                    '3.    ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Inhale, return to the starting position and repeat.',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Colors.grey, // You can adjust the color of the divider as needed
                thickness: 1, // You can adjust the thickness of the divider as needed
              ),
            ),// Adding space between the text
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'KEY TIPS',
                style: TextStyle(
                  fontSize: 21.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Text(
                    '1.    ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Do not lock out your arms at the top.',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Text(
                    '2.    ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Keep a straight back during the exercise.',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Text(
                    '3.    ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Keep your elbows slightly bent throughout the movement.',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
