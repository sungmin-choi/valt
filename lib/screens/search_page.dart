import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/widgets/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SearchBar(),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: const ButtonStyle(),
                  child: const Text(
                    '국가별',
                    style: TextStyle(color: ColorStyles.gray90),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
