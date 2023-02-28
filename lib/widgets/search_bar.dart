import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  late Future<List<String>> _searchResults;

  Future<List<String>> _getSearchResults(String query) async {
    // Simulate an asynchronous search request
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(10, (index) => '$query Result ${index + 1}');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: ColorStyles.gray15,
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: '어떤 위스키가 궁금하세요?',
                hintStyle: TextStyle(color: ColorStyles.gray50),
                border: InputBorder.none,
              ),
              onChanged: (query) {
                setState(() {
                  _searchResults = _getSearchResults(query);
                });
              },
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
