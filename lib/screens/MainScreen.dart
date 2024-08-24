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
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background with light blue color
          Container(
            color: const Color(0xFFE6F3FF), // Light blue background
          ),
          // Dark blue circular shape
          Positioned(
            top: -screenSize.height * 0.1,
            left: -screenSize.width * 0.2,
            right: -screenSize.width * 0.2,
            child: Container(
              height: screenSize.height * 0.6,
              decoration: BoxDecoration(
                color: const Color(0xFF1E2A3A), // Dark blue color
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(screenSize.width * 0.5),
                  bottomRight: Radius.circular(screenSize.width * 0.5),
                ),
              ),
            ),
          ),
          // Scrollable content
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: kToolbarHeight + 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Newspalet Component
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 22.0),
                  height: screenSize.height / 3,
                  child: const Newspalet(),
                ),
                const SizedBox(height: 5),
                // FilterCard Component
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: FilterCard(),
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
