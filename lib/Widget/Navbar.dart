import "package:doctor_panel/Screens/DoctorProfile_Screen.dart";
import "package:doctor_panel/Screens/Schedule_Screen.dart";
import "package:doctor_panel/Screens/Setting_Screen.dart";
import "package:doctor_panel/Screens/message_Screen.dart";
import "package:doctor_panel/Screens/yourPatient_Screen.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class NavbarRoots extends StatefulWidget {
  const NavbarRoots({super.key});

  @override
  State<NavbarRoots> createState() => _NavbarRootsState();
}

class _NavbarRootsState extends State<NavbarRoots> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    // Doctor Profile Screen
    DoctorProfileScreen(),
    // Message Screen
    MessageScreen(),
    // Schedule Screen
    ScheduleScreen(),
    // Settings Screen
    SettingsScreen(),
    // Patient Screen
    YourPatient(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text_fill),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Schedules",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2),
              label: "Patients",
            )
          ],
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF0000FF),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
