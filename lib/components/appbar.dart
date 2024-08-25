import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/login.dart'; 

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white70,
      elevation: 2,
      title: const Text(
        'Bus.lk',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1E2C4C),
        ),
        overflow: TextOverflow.ellipsis, 
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.login,
            size: 30,
            color: Color(0xFF1E2C4C),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const LoginScreen();
              },
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const LoginScreen(); 
                },
              );
            },
            child: const Text(
              'Log In',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E2C4C), 
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
