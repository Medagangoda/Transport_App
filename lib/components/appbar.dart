import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/login.dart'; // Import the LoginScreen

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF2C2E3A), // AppBar background color
      elevation: 2,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 5), // Space between the icon and text
            Text(
              'Bus.lk',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color
              ),
              overflow: TextOverflow.visible,
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Row(
            children: [
              const Icon(
                Icons.login,
                size: 30,
                color: Colors.white,
              ),
              const SizedBox(width: 5), // Space between the icon and text
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const LoginScreen(); // Show the LoginScreen as a pop-up
                    },
                  );
                },
                child: Text(
                  'Log In',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
