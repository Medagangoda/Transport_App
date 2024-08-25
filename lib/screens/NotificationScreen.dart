import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: Center(
        child: const Text('Notification Page Content'),
      ),
    );
  }
}
