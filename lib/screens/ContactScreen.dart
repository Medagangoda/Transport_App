import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  
  void _launchCaller(String number) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: number,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $number';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Emergency Situation'),
        backgroundColor: Color.fromARGB(255, 167, 76, 88), 
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Ambulance Service Card
          _buildContactCard(
            context: context,
            title: 'සුව සැරිය (1990)',
            number: '1990',
            description: 'Call for ambulance services in case of emergencies.',
            icon: Icons.local_hospital_rounded,
          ),
          const SizedBox(height: 10),
          // Hospital Card
          _buildContactCard(
            context: context,
            title: 'රාජ්‍ය රෝහල් සේවය (1010)',
            number: '1010',
            description: 'Contact the nearest hospital for medical assistance.',
            icon: Icons.local_hospital,
          ),
          const SizedBox(height: 10),
          // Police Card
          _buildContactCard(
            context: context,
            title: 'Police (119)',
            number: '119',
            description: 'Dial this number for police assistance.',
            icon: Icons.local_police,
          ),
          const SizedBox(height: 10),
          // Fire Service Card
          _buildContactCard(
            context: context,
            title: 'ශ්‍රී ලන්කා ගිනිනිවීමේ සේවය',
            number: '110',
            description: 'Call for fire emergencies and rescue services.',
            icon: Icons.fire_extinguisher,
          ),
        ],
      ),
    );
  }

  // Helper method to create a contact card
  Widget _buildContactCard({
    required BuildContext context,
    required String title,
    required String number,
    required String description,
    required IconData icon,
  }) {
    return Card(
      color: const Color(0xFFE6F3FF), // Light blue card background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: const Color(0xFF1E2A3A), // Dark blue border color
        ),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF0A21C0), size: 30),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.call, color: Colors.green),
          onPressed: () => _launchCaller(number),
        ),
        onTap: () => _launchCaller(number), // Tap anywhere on the card to call
      ),
    );
  }
}
