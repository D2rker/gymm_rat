import 'package:flutter/material.dart';


class DietPage extends StatelessWidget {
  const DietPage({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Diet Page Content',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: DietPage(),
//   ));
// }
