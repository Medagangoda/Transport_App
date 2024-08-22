// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'newsReadMoreButton.dart';

class Newspalet extends StatelessWidget {
  const Newspalet({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent, // Semi-transparent background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'BUS.LK news card input this news',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 247, 27, 27),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'mekata oni visathara tika bckground eken en vidihata loku hallak dapn',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: NewsReadMoreButton(
                newsTitle: 'Breaking News: Flutter 3.0 Released!',
                newsContent: 'Flutter 3.0 has been released with amazing new features and improvements, including...'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
