import 'package:flutter/material.dart';

class NewsReadMoreButton extends StatelessWidget {
  final String newsTitle;
  final String newsContent;

  const NewsReadMoreButton({
    Key? key,
    required this.newsTitle,
    required this.newsContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Text(newsTitle, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              content: SingleChildScrollView(
                child: Text(newsContent, style: const TextStyle(fontSize: 18)),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close', style: TextStyle(color: Colors.blue)),
                ),
              ],
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1E2A3A),
      ),
      child: const Text(
        'Read More',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
