import 'package:flutter/material.dart';
import 'package:valt/controller/search_keywords_controller.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/widgets/filter/badge.dart';
import 'package:valt/widgets/filter/category_list.dart';
import 'package:valt/widgets/filter/country_list.dart';
import 'package:valt/widgets/filter/price_range_list.dart';
import 'package:valt/widgets/filter/search_keywords.dart';
import 'package:valt/widgets/search_bar.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchKeywordsController searchController =
      Get.put(SearchKeywordsController());
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                onFocus: () {
                  setState(() {
                    tabIndex = 3;
                  });
                },
                cancelFocus: () {
                  setState(() {
                    tabIndex = 0;
                  });
                },
              ),
              if (tabIndex != 3)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: Row(
                    children: [
                      Badge(
                          text: '국가별',
                          onClick: () {
                            setState(() {
                              tabIndex = 0;
                            });
                          },
                          isFocus: tabIndex == 0),
                      const SizedBox(
                        width: 8,
                      ),
                      Badge(
                          text: '키테고리별',
                          onClick: () {
                            setState(() {
                              tabIndex = 1;
                            });
                          },
                          isFocus: tabIndex == 1),
                      const SizedBox(
                        width: 8,
                      ),
                      Badge(
                          text: '금액대별',
                          onClick: () {
                            setState(() {
                              tabIndex = 2;
                            });
                          },
                          isFocus: tabIndex == 2)
                    ],
                  ),
                ),
              if (tabIndex == 0) const CountryList(),
              if (tabIndex == 1) const CategoryList(),
              if (tabIndex == 2) const PriceRangeList(),
              if (tabIndex == 3) const SearchKeywordsContainer()
            ],
          ),
        ),
      ),
    );
  }
}
