import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/searchResult.dart';

class FilterCard extends StatefulWidget {
  const FilterCard({Key? key}) : super(key: key);

  @override
  _FilterCardState createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  DateTime? _selectedDate;
  String _selectedDestination = 'Any';
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
        'destination1': 'Sai Gon',
        'destination2': 'Ha Noi',
        'details': '24hrs 00mins travel',
        'price': '1,000,000 VND',
      },
      {
        'time1': '13:00',
        'time2': '14:00',
        'destination1': 'Sai Gon',
        'destination2': 'Da Nang',
        'details': '20hrs 00mins travel',
        'price': '800,000 VND',
      },
      {
        'time1': '15:00',
        'time2': '17:00',
        'destination1': 'Ha Noi',
        'destination2': 'Da Nang',
        'details': '16hrs 00mins travel',
        'price': '1,200,000 VND',
      },
    ];

    if (_selectedDestination != 'Any') {
      data = data.where((item) {
        return item['destination1'] == _selectedDestination ||
            item['destination2'] == _selectedDestination;
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
          color: Colors.transparent,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Keywords',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.amber.withOpacity(0.8),
                          prefixIcon: const Icon(Icons.search, color: Colors.black),
                          hintText: 'Search',
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Filter for Activity
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Start Location',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration.collapsed(hintText: ''),
                          value: 'Activity',
                          items: ['Activity', 'Option 1', 'Option 2'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: const TextStyle(color: Colors.black)),
                            );
                          }).toList(),
                          onChanged: (value) {},
                          isExpanded: true,
                          dropdownColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Filter for Destination
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'End Location',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration.collapsed(hintText: ''),
                          value: _selectedDestination,
                          items: ['Any', 'Sai Gon', 'Ha Noi', 'Da Nang'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: const TextStyle(color: Colors.black)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedDestination = value ?? 'Any';
                            });
                          },
                          isExpanded: true,
                          dropdownColor: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Filter for Date
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Date',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.calendar_today, color: Colors.black),
                              const SizedBox(width: 10),
                              Text(
                                _selectedDate != null
                                    ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                                    : 'DATE',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Search Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                      ),
                      onPressed: () {
                        _filterResults(); // Handle search and update results
                      },
                      child: const Text(
                        'Search',
                        style: TextStyle(color: Colors.black, fontSize: 16),
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