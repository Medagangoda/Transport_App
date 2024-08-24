import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  final List<Map<String, String>> results;

  const SearchResults({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          'No results found.',
          style: TextStyle(color: Color.fromARGB(255, 6, 64, 129), fontSize: 16),
        ),
      );
    }

    return Column(
      children: results.map((result) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          color: const Color(0xFF1E2C4C),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            result['time1'] ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 40),
                          const Icon(Icons.train, color: Colors.white),
                          const SizedBox(width: 10),
                          Text(
                            result['destination1'] ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            result['time2'] ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 40),
                          const Icon(Icons.train, color: Colors.white),
                          const SizedBox(width: 10),
                          Text(
                            result['destination2'] ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        result['details'] ?? '',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        result['price'] ?? '',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Arrow Icon button
                // IconButton(
                //   onPressed: () {
                    
                //   },
                //   icon: const Icon(Icons.arrow_forward, color: Colors.white),
                // ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
