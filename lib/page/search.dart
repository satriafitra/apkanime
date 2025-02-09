import 'package:flutter/material.dart';
import 'package:KURONIME_APP/page/nonton.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  // List of anime with images, names, durations, ratings, and prologs
  List<Map<String, String>> _allItems = [
    {
      'image': 'assets/anim.jpeg',
      'name': 'Haikyuu',
      'duration': '24 mins',
      'rating': '4.5',
      'prolog': 'A thrilling adventure with epic battles.',
    },
    {
      'image': 'assets/anim1.jpeg',
      'name': 'Attack On Titan',
      'duration': '22 mins',
      'rating': '4.0',
      'prolog': 'A story full of mystery and suspense.',
    },
    {
      'image': 'assets/baru2.jpg',
      'name': 'Solo Leveling',
      'duration': '20 mins',
      'rating': '4.8',
      'prolog': 'A heartwarming tale of friendship and courage.',
    },
    {
      'image': 'assets/baru1.jpg',
      'name': 'Bleach',
      'duration': '30 mins',
      'rating': '4.9',
      'prolog': 'A dark and intense journey through a dystopian world.',
    },
    {
      'image': 'assets/baru3.jpg',
      'name': 'Sakamoto Days',
      'duration': '25 mins',
      'rating': '4.2',
      'prolog': 'A futuristic anime about technology and AI.',
    },
    {
      'image': 'assets/episode1.jpeg',
      'name': 'Record Of Ragnarok',
      'duration': '18 mins',
      'rating': '5.0',
      'prolog': 'A revolutionary show with groundbreaking animation.',
    },
  ];

  List<Map<String, String>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
  }

  // Filter function for search
  void _filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredItems = _allItems;
      });
    } else {
      setState(() {
        _filteredItems = _allItems
            .where((item) => item['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37), // Latar belakang abu-abu
      body: Column(
        children: [
          SizedBox(height: 30), // Adjust this value to move it lower
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterSearchResults,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF333333),
                hintText: 'Search for Anime...',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.white),
                        onPressed: () {
                          _searchController.clear();
                          _filterSearchResults('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: _filteredItems.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            // Add action when the anime item is clicked
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(20),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  // Action for clicking on the anime item
                                },
                                child: Container(
                                  height: 220,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 44, 44, 44),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          item['image'] ?? 'assets/default_image.jpeg',
                                          height: 220,
                                          width: 160,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item['name'] ?? 'Unknown Anime',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                item['duration'] ?? 'Unknown duration',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                item['prolog'] ?? 'No prolog available.',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 18,
                                                  ),
                                                  Text(
                                                    item['rating'] ?? '0.0',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigasi ke NontonPage
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => NontonPage(),
                                                    ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: const Color.fromARGB(255, 236, 145, 9),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                                                  elevation: 5,
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: const [
                                                    Icon(
                                                      Icons.play_arrow,
                                                      color: Colors.white,
                                                      size: 24,
                                                    ),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      'Play',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Color.fromARGB(255, 122, 56, 2),
                                                        fontSize: 16,
                                                        fontFamily: 'Montserrat',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No results found',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
