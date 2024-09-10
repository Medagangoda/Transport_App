import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/appbar.dart';
import 'package:flutter_application_1/components/filterCard.dart';
import 'package:flutter_application_1/components/newsPalet.dart';
import 'package:flutter_application_1/screens/ContactScreen.dart';
import 'package:flutter_application_1/screens/NotificationScreen.dart';
import 'package:flutter_application_1/screens/BookingScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    MainContent(), 
    BookingScreen(), 
    ContactScreen(), 
    NotificationScreen(), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: MyAppBar(),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background with light blue color
          Container(
            color: const Color(0xFFE6F3FF), 
          ),
          // Dark blue circular shape
          Positioned(
            top: -screenSize.height * 0.1,
            left: -screenSize.width * 0.2,
            right: -screenSize.width * 0.2,
            child: Container(
              height: screenSize.height * 0.6,
              decoration: BoxDecoration(
                color: const Color(0xFF1E2A3A), 
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(screenSize.width * 0.5),
                  bottomRight: Radius.circular(screenSize.width * 0.5),
                ),
              ),
            ),
          ),
          
          _screens[_selectedIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF0A21C0),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add),
            label: 'Alert',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: kToolbarHeight + 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // Newspalet 
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 22.0),
            height: screenSize.height / 3,
            child: const Newspalet(),
          ),
          const SizedBox(height: 32),


          // FilterCard 
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: FilterCard(),
          ),
          const SizedBox(height: 20),
          
        ],
      ),
    );
  }
}
