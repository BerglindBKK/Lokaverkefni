import 'package:flutter/material.dart';
import 'package:lokaverkefni/widgets/recipes.dart';



// List of search terms
/*List<String> searchTerms = <String>[
  "Apple",
  "Banana",
  "Mango",
  "Pear",
  "Watermelons",
  "Blueberries",
  "Pineapples",
  "Strawberries"
];*/

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  String query = "";  // Store the search input

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Search Bar Example')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Search bar at the top
              SearchBar(
                onChanged: (String newQuery) {
                  setState(() {
                    query = newQuery;  // Update the query when user types
                  });
                },
                leading: const Icon(Icons.search),
              ),

              // Suggestions list
              Expanded(
                child: ListView(
                  children: _getFilteredSearchTerms(query).map((term) {
                    return ListTile(
                      title: Text(term),
                      onTap: () {
                        setState(() {
                          query = term; // Update query when a suggestion is tapped
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to filter search terms based on the query
  List<String> _getFilteredSearchTerms(String query) {
    return _registeredRecipes
        .where((term) => term.toLowerCase().contains(query.toLowerCase())) // Filter by query
        .toList();
  }
}

class SearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Widget leading;

  const SearchBar({
    super.key,
    required this.onChanged,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,  // Pass user input to onChanged
      decoration: InputDecoration(
        prefixIcon: leading,
        hintText: 'Search...',
        border: OutlineInputBorder(),
      ),
    );
  }
}
