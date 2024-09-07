import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/searchResult.dart';

class FilterCard extends StatefulWidget {
  const FilterCard({Key? key}) : super(key: key);

  @override
  _FilterCardState createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  DateTime? _selectedDate;
  String _fromLocation = 'Makubura';
  String _toLocation = 'Galle';
  List<Map<String, String>> filteredResults = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

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
        'details': 'Waduge Trasport Service',
        'price': 'Rs. 1550.00',
      },
      {
        'time1': '12:00',
        'time2': '12:00',
        'destination1': 'Makubura',
        'destination2': 'kaluthara',
        'details': 'Dinesh Trasport Service',
        'price': 'Rs. 350.00',
      },
      {
        'time1': '12:00',
        'time2': '12:00',
        'destination1': 'Petta',
        'destination2': 'Anuradhapuraya',
        'details': 'Mihisara Trasport Service',
        'price': 'Rs. 700.00',
      },
      {
        'time1': '12:00',
        'time2': '12:00',
        'destination1': 'Anuradhapuraya',
        'destination2': 'Petta',
        'details': 'Mihisara Trasport Service',
        'price': 'Rs. 700.00',
      },
      {
        'time1': '13:00',
        'time2': '14:00',
        'destination1': 'Makubura',
        'destination2': 'ELpitiya',
        'details': 'Vimukthi Express',
        'price': 'Rs.800.00',
      },
      {
        'time1': '13:00',
        'time2': '14:00',
        'destination1': 'Elpitiya',
        'destination2': 'Makubura',
        'details': 'Vimukthi Express',
        'price': 'Rs.800.00',
      },
      {
        'time1': '10:00',
        'time2': '12:00',
        'destination1': 'Rathnapura',
        'destination2': 'Ebilipitiya',
        'details': 'Sampath Trasport Service',
        'price': 'Rs. 200.00',
      },
      {
        'time1': '15:00',
        'time2': '17:00',
        'destination1': 'Rathnapura',
        'destination2': 'Ebilipitiya',
        'details': 'Sampath Trasport Service',
        'price': 'Rs. 200.00',
      },
      {
        'time1': '15:00',
        'time2': '17:00',
        'destination1': 'Rathnapura',
        'destination2': 'Rathnapura',
        'details': 'Sampath Trasport Service',
        'price': 'Rs. 200.00',
      },
    ];

    if (_fromLocation.isNotEmpty && _toLocation.isNotEmpty) {
      data = data.where((item) {
        return item['destination1'] == _fromLocation &&
            item['destination2'] == _toLocation;
      }).toList();
    }

    setState(() {
      filteredResults = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white70,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // From
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'From',
                            style: TextStyle(
                              color: Color(0xFF757575),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E2C4C).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: DropdownButtonFormField<String>(
                              decoration:
                                  const InputDecoration.collapsed(hintText: ''),
                              value: _fromLocation,
                              items: [
                                'Makubura',
                                'Mathara',
                                'Rathnapura',
                                'Galle',
                                'Ebilipitiya',
                                'Anuradhapuraya',
                                'kaluthara'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _fromLocation = value!;
                                });
                              },
                              isExpanded: true,
                              dropdownColor:
                                  const Color(0xFF1E2C4C).withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'To',
                            style: TextStyle(
                              color: Color(0xFF757575),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E2C4C)
                                  .withOpacity(0.8), // Updated background color
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: DropdownButtonFormField<String>(
                              decoration:
                                  const InputDecoration.collapsed(hintText: ''),
                              value: _toLocation,
                              items: [
                                'Makubura',
                                'Mathara',
                                'Rathnapura',
                                'Galle',
                                'Ebilipitiya',
                                'Anuradhapuraya',
                                'kaluthara'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _toLocation = value!;
                                });
                              },
                              isExpanded: true,
                              dropdownColor:
                                  const Color(0xFF1E2C4C).withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Date and Return Toggle
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Date',
                            style: TextStyle(
                              color: Color(0xFF757575),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 5),
                          InkWell(
                            onTap: () => _selectDate(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border:
                                    Border.all(color: const Color(0xFFe0e0e0)),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.calendar_today,
                                      color: Color(0xFF757575)),
                                  const SizedBox(width: 10),
                                  Text(
                                    _selectedDate != null
                                        ? '${_selectedDate!.day}, ${_selectedDate!.month} ${_selectedDate!.year}'
                                        : 'Select Date',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Return?',
                            style: TextStyle(
                              color: Color(0xFF757575),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              border:
                                  Border.all(color: const Color(0xFFe0e0e0)),
                            ),
                            child: Row(
                              children: [
                                Switch(
                                  value: true,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  activeColor: const Color(0xFF1E2C4C),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Search Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E2C4C),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: () {
                        _filterResults();
                      },
                      child: const Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Display Filtered Results
        SearchResults(results: filteredResults),
      ],
    );
  }
}
