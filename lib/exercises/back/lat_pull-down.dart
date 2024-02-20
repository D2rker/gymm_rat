import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class WorkoutLatPullDownDetails extends StatefulWidget {
  const WorkoutLatPullDownDetails({Key? key}) : super(key: key);

  @override
  _WorkoutLatPullDownDetailsState createState() =>
      _WorkoutLatPullDownDetailsState();
}

class _WorkoutLatPullDownDetailsState extends State<WorkoutLatPullDownDetails> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
        'images/back/lat_pull_down.mp4');

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
                    'Lat Pull-down',
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
                    'Back, Shoulder, Traps',
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
                    'Cable machine, Flat bench',
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
                'Sit on the bench with your knees secured under the pads. Hold the bar with your hands shoulder width apart in an overhand grip and arms stretched upward.',
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
                    'Contract your lats and bend your elbows to pull the bar \ndown to your chest.',
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
                    'Pause for a count and return to the starting position slowly \nand repeat.',
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
                    'Lean slightly backward and do not arch your back during the \nmovement.',
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
                    'Keep the upward movement to avoid pulling yourself out of \nposition.',
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
                    'To add difficulty, add weight gradually.',
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
