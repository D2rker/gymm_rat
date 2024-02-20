import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class WorkoutLegExtensionDetails extends StatefulWidget {
  const WorkoutLegExtensionDetails({Key? key}) : super(key: key);

  @override
  _WorkoutLegExtensionDetailsState createState() =>
      _WorkoutLegExtensionDetailsState();
}

class _WorkoutLegExtensionDetailsState extends State<WorkoutLegExtensionDetails> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
        'images/legs/leg_extension.mp4');

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
                    'Leg Extension',
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
                    'Quadriceps',
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
                    'Leg Extension Machine',
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
                'Sit on the machine with your back against the pad and feet secured under the footpads. Hold the handles for stability.',
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
                    '1.    \n',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Exhale and extend your knees until your legs are parallel to \nthe floor.',
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
                    'Pause for a count at the top position.',
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
                    'Inhale, bend the knees to the starting position and repeat.',
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
                    'Do not lock out your knees at the top.',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
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
                    'Do not let your knees bend more than 90 degrees when \nlowering.',
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
