import 'package:flutter/material.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Center(
        child: const Text('About Us Page Content'),
      ),
    );
  }
}
