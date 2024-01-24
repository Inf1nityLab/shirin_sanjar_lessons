import 'package:flutter/material.dart';

class SearchBarDemo extends StatefulWidget {
  const SearchBarDemo({Key? key}) : super(key: key);

  @override
  State<SearchBarDemo> createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  final List<String> names = [
    "John Doe",
    "Jane Doe",
    "John Smith",
    "Jane Smith",
    "Mike Jones",
    "Sarah Jones",
  ];

  late List<String> filteredNames;

  @override
  void initState() {
    super.initState();
    filteredNames = names;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Bar Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
              ),
              onChanged: (query) {
                setState(() {
                  filteredNames = names
                      .where((name) => name.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredNames.length,
                itemBuilder: (context, index) {
                  return Text(filteredNames[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}