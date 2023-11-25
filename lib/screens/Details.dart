import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final dynamic showDetails;

  const Details({Key? key, required this.showDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          showDetails['name'] ?? 'Movie Details',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: SizedBox(
                  height: 500, // Set the image height here
                  child: showDetails['image'] != null
                      ? Image.network(
                          showDetails['image']['medium'] ??
                              'https://tinyurl.com/5n7ad3se',
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Placeholder();
                          },
                        )
                      : const Placeholder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Summary:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                showDetails['summary'] != null
                    ? showDetails['summary']
                        .replaceAll(RegExp(r'<[^>]*>'), '')
                        .trim()
                    : 'No summary available.',
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Genres:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                children: (showDetails['genres'] as List<dynamic>? ?? [])
                    .map((genre) => Chip(label: Text(genre)))
                    .toList(),
              ),
              // Add more details as needed based on the showDetails data
            ],
          ),
        ),
      ),
    );
  }
}
