import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import "./Details.dart";

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<dynamic> searchResults = [];
  bool isLoading = false;
  final TextEditingController _searchController = TextEditingController();

  Future<void> searchShows(String searchTerm) async {
    setState(() {
      isLoading = true;
    });
    final response = await http
        .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$searchTerm'));
    if (response.statusCode == 200) {
      setState(() {
        searchResults = json.decode(response.body);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load search results');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for shows',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    String searchTerm = _searchController.text;
                    if (searchTerm.isNotEmpty) {
                      searchShows(searchTerm);
                    }
                  },
                ),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  searchShows(value);
                }
              },
            ),
          ),
          Expanded(
            child: searchResults.isEmpty
                ? const Center(
                    child: Text('Ooops, no results found'),
                  )
                : ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (BuildContext context, int index) {
                      final show = searchResults[index]['show'];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(showDetails: show),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                  width: 50, // Adjusted width to 50%
                                  height: 75, // Adjusted height to 50%
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        show['image'] != null
                                            ? show['image']['medium']
                                            : 'https://tinyurl.com/5n7ad3se',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: Text(
                                  show['name'] ?? 'Title not available',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
