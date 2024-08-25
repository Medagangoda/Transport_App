import 'package:flutter/material.dart';

class BookingResultScreen extends StatelessWidget {
  final String from;
  final String to;

  const BookingResultScreen({
    Key? key,
    required this.from,
    required this.to,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Results'),
        backgroundColor: const Color(0xFF2C2E3A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: const Icon(Icons.location_on, size: 40, color: Colors.grey),
                title: Text('From: $from'),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: const Icon(Icons.location_on_outlined, size: 40, color: Colors.grey),
                title: Text('To: $to'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
