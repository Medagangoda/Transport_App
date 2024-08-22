import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/appbar.dart';
import 'package:flutter_application_1/components/filterCard.dart';
import 'package:flutter_application_1/components/newsPalet.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const MyAppBar(),
      extendBodyBehindAppBar: true, // Extend body behind the AppBar to show background
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Container(
              color: const Color(0xFF6A778A), 
              child: Image.asset(
                'assets/wall.jpeg', // Background image
                fit: BoxFit.cover,
                width: screenSize.width,
                height: screenSize.height,
              ),
            ),
          ),
          
          // Scrollable content on top of the fixed background
          SingleChildScrollView(
            padding: EdgeInsets.only(top: kToolbarHeight + 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                // Newspalet Component-------------------------------------------
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 22.0),
                  height: screenSize.height / 3, // One-third of the screen height
                  child: const Newspalet(), // Insert the Newspalet component
                ),
                const SizedBox(height: 5),
                // FilterCard Component---------------------------------------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: const FilterCard(), // Insert the FilterCard component
                ),
                const SizedBox(height: 20),
                // Add more widgets below if needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
