import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymm_rat/pages/alarm_page.dart';
import 'package:gymm_rat/pages/diet_page.dart';
import 'package:gymm_rat/pages/exercise.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _isDarkMode = false; // Track dark mode
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _openMenuPage(BuildContext context) {
    _scaffoldKey.currentState!.openDrawer();
  }

  // Function to toggle dark mode
  void _toggleDarkMode(bool? value) {
    if (value != null) {
      setState(() {
        _isDarkMode = value;
        // Implement logic to switch between dark and light mode here
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Gym Rat',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu), // You can change the icon as needed
            color: Colors.white,
            onPressed: () {
              _openMenuPage(context);
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isDarkMode,
                    onChanged: _toggleDarkMode,
                  ),
                  const Text('Switch to Dark Mode'),
                ],
              ),
              ListTile(
                title: const Text('Sign out'),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/exercise.png',
                width: 33,
                height: 33,
              ),
              label: 'Workout',
            ),

            // diet tab button//

            // const BottomNavigationBarItem(
            //   icon: Icon(Icons.fastfood_rounded, color: Colors.white),
            //   label: 'Diet',
            // ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.alarm, color: Colors.white),
              label: 'Alarm',
            ),
          ],
          selectedItemColor: Colors.white, // Color for the selected item
          unselectedItemColor: Colors.black, // Color for unselected items
          backgroundColor: Colors.black, // Background color of the BottomNavigationBar
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          selectedLabelStyle: const TextStyle(color: Colors.white), // Style for selected label text
          unselectedLabelStyle: const TextStyle(color: Colors.black), // Style for unselected label text
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            Exercise(),
            // const DietPage(),
            const AlarmPage(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

