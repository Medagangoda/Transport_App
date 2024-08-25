import 'package:flutter/material.dart';

// In BookingScreen.dart
class BookingScreen extends StatelessWidget { // Rename to match exactly
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
      ),
      body: Center(
        child: const Text('Booking'),
      ),
    );
  }
}

