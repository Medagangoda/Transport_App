import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  String? _selectedFrom;
  String? _selectedTo;
  List<Map<String, String>> filteredData = [];

  void _filterResults() {
    List<Map<String, String>> data = [
      {
        'time1': '12:00',
        'time2': '12:00',
        'destination1': 'Makubura',
        'destination2': 'Galle',
        'details': 'Vimukthi Express',
        'price': 'Rs. 1500.00',
      },
      {
        'time1': '12:00',
        'time2': '12:00',
        'destination1': 'Makubura',
        'destination2': 'Galle',
        'details': 'Sampath Transport Service',
        'price': 'Rs. 1550.00',
      },
      {
        'time1': '12:00',
        'time2': '12:00',
        'destination1': 'Makubura',
        'destination2': 'Kaluthara',
        'details': 'Dinesh Transport Service',
        'price': 'Rs. 350.00',
      },
      {
        'time1': '12:00',
        'time2': '12:00',
        'destination1': 'Petta',
        'destination2': 'Anuradhapuraya',
        'details': 'Mihisara Transport Service',
        'price': 'Rs. 700.00',
      },
      {
        'time1': '12:00',
        'time2': '12:00',
        'destination1': 'Anuradhapuraya',
        'destination2': 'Petta',
        'details': 'Mihisara Transport Service',
        'price': 'Rs. 700.00',
      },
      {
        'time1': '13:00',
        'time2': '14:00',
        'destination1': 'Makubura',
        'destination2': 'Mathara',
        'details': 'Vimukthi Express',
        'price': 'Rs. 1800.00',
      },
      {
        'time1': '13:00',
        'time2': '14:00',
        'destination1': 'Mathara',
        'destination2': 'Makubura',
        'details': 'Vimukthi Express',
        'price': 'Rs. 1800.00',
      },
      {
        'time1': '10:00',
        'time2': '12:00',
        'destination1': 'Rathnapura',
        'destination2': 'Ebilipitiya',
        'details': 'Sampath Transport Service',
        'price': 'Rs. 200.00',
      },
      {
        'time1': '15:00',
        'time2': '17:00',
        'destination1': 'Rathnapura',
        'destination2': 'Ebilipitiya',
        'details': 'Sampath Transport Service',
        'price': 'Rs. 200.00',
      },
      {
        'time1': '15:00',
        'time2': '17:00',
        'destination1': 'Rathnapura',
        'destination2': 'Rathnapura',
        'details': 'Sampath Transport Service',
        'price': 'Rs. 200.00',
      },
    ];

    setState(() {
      filteredData = data.where((entry) {
        return entry['destination1'] == _selectedFrom && entry['destination2'] == _selectedTo;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Booking Your Tickets',style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF1E2C4C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.grey),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _selectedFrom,
                            decoration: const InputDecoration(
                              labelText: 'From',
                              border: InputBorder.none,
                            ),
                            items: <String>['Makubura', 'Petta', 'Anuradhapuraya', 'Rathnapura']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedFrom = newValue;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, color: Colors.grey),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _selectedTo,
                            decoration: const InputDecoration(
                              labelText: 'To',
                              border: InputBorder.none,
                            ),
                            items: <String>[
                              'Galle',
                              'Kaluthara',
                              'Anuradhapuraya',
                              'Mathara',
                              'Ebilipitiya',
                              'Petta'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedTo = newValue;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E2C4C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 11,horizontal: 50),
              ),
              onPressed: _filterResults,
              child: const Text(
                'Search',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  final entry = filteredData[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const Icon(Icons.directions_bus, size: 40, color: Colors.grey),
                      title: Text('${entry['details']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('From: ${entry['destination1']} - To: ${entry['destination2']}'),
                          Text('Departure: ${entry['time1']} - Arrival: ${entry['time2']}'),
                          Text('Price: ${entry['price']}'),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(190, 10, 28, 150),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            onPressed: () {
                              // Handle booking logic here
                            },
                            child: const Center(
                              child: Text(
                                'Booking',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
