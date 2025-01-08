import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';

// SearchBarApp widget to display a search bar and list of recipes filtered by query.
class SearchBarApp extends StatefulWidget {
  final List<Recipe> recipes; // Accept recipes list

  const SearchBarApp({super.key, required this.recipes});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  String query = "";  // Store the search input

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Search bar at the top
          TextField(
            onChanged: (String newQuery) {
              setState(() {
                query = newQuery;  // Update the query when user types
              });
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search...',
              border: OutlineInputBorder(),
            ),
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
    );
  }

  // Function to filter search terms based on the query
  List<String> _getFilteredSearchTerms(String query) {
    return widget.recipes  // Use the list passed to SearchBarApp
        .map((recipe) => recipe.title)  // Assuming you want to search by recipe title
        .where((term) => term.toLowerCase().contains(query.toLowerCase())) // Filter by query
        .toList();
  }
}
