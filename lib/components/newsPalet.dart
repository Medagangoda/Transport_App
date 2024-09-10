import 'package:flutter/material.dart';
import 'newsReadMoreButton.dart';

class Newspalet extends StatelessWidget {
  const Newspalet({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70, 
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
                children: const [
                  Text(
                    'BUS.LK news card ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E2A3A),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This period shows the information about the full details of the news received by our Bus. lk application, which includes a detailed introduction of the news and other details. It should be noted that it is a fully responsible news.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: NewsReadMoreButton(
                newsTitle: 'Breaking News: ',
                newsContent: 'This period shows the information about the full details of the news received by our Busda lk application, which includes a detailed introduction of the news and other details. It should be noted that it is a fully responsible news.'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
