import 'package:flutter/material.dart';
import '../screens/ContactScreen.dart';
import '../screens/AboutusScreen.dart';

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
            const Icon(
              Icons.directions_bus,
              size: 30,
              color: Color(0xFF0A21C0), // Icon color
            ),
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
        PopupMenuButton<int>(
          
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 34,
          ),
          onSelected: (value) {
            // Menu item click
            switch (value) {
              case 1:
                print("Home clicked");
                break;
              case 2:
                print("Booking clicked");
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactScreen(),
                  ),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutusScreen(),
                  ),
                );
                break;
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: Text(
                "BUS.lk",
                style: TextStyle(
                  fontSize: 38,
                  color: Color(0xFF0A21C0), // Color for title
                ),
              ),
              textStyle: TextStyle(fontSize: 18, color: Colors.yellow),
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25),
            ),
            PopupMenuItem(
              value: 1,
              child: ListTile(
                leading: const Icon(Icons.home, color: Colors.white),
                title: const Text(
                  "Home",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
              textStyle: const TextStyle(fontSize: 18, color: Colors.yellow),
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
            ),
            PopupMenuItem(
              value: 2,
              child: ListTile(
                leading: const Icon(Icons.book, color: Colors.white),
                title: const Text(
                  "Booking",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
              textStyle: const TextStyle(fontSize: 18, color: Colors.yellow),
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
            ),
            PopupMenuItem(
              value: 3,
              child: ListTile(
                leading: const Icon(Icons.contact_mail, color: Colors.white),
                title: const Text(
                  "Contact",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
              textStyle: const TextStyle(fontSize: 18, color: Colors.yellow),
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
            ),
            PopupMenuItem(
              value: 4,
              child: ListTile(
                leading: const Icon(Icons.info, color: Colors.white),
                title: const Text(
                  "About Us",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
              textStyle: const TextStyle(fontSize: 18, color: Colors.yellow),
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
            ),
          ],
          color: Colors.white60, // Popup menu background color
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.white60, // Border color
            ),
          ),
          constraints: const BoxConstraints(
            minWidth: 150, // Width of the popup menu
            maxWidth: 200,
          ),
        ),
      ],
    );
  }
}
