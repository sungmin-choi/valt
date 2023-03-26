import 'package:valt/controller/product_controller.dart';
import 'package:valt/service/network_handler/network_handler.dart';
import 'package:valt/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:valt/controller/search_keywords_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:get/get.dart';

class SearchBar extends StatefulWidget {
  SearchBar({super.key, required this.onFocus, required this.cancelFocus});
  final Function() onFocus;
  final Function() cancelFocus;

  FocusNode textFocus = FocusNode();
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  var controller = Get.find<SearchKeywordsController>();
  var productController = Get.find<ProductController>();
  bool _focus = false;

  @override
  void initState() {
    // TODO: implement initState
    controller.textController.clear();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Container(
            height: 48,
            decoration: const BoxDecoration(
              color: ColorStyles.gray15,
            ),
            child: Row(
              children: const [
                SizedBox(width: 16),
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 8),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: ColorStyles.gray15,
              ),
              child: Focus(
                onFocusChange: (focus) {
                  if (focus) {
                    widget.onFocus();
                    setState(() {
                      _focus = focus;
                    });
                  }
                },
                child: TextField(
                  focusNode: widget.textFocus,
                  textInputAction: TextInputAction.go,
                  controller: controller.textController,
                  decoration: const InputDecoration(
                    hintText: '어떤 위스키가 궁금하세요?',
                    hintStyle: TextStyle(color: ColorStyles.gray50),
                    border: InputBorder.none,
                  ),
                  onSubmitted: (query) async {
                    if (query.isNotEmpty) {
                      await NetWorkHandler.storeRecentSearchs(query);
                    }
                  },
                  onChanged: (query) async {
                    EasyDebounce.debounce(
                        'debouncer', const Duration(milliseconds: 500),
                        () async {
                      controller.fetchProductList(query, 'MOST');
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          if (_focus)
            GestureDetector(
              onTap: () {
                widget.cancelFocus();

                setState(() {
                  _focus = false;
                });
                controller.textController.clear();
                controller.productList.value.clear();
                widget.textFocus.unfocus();
              },
              child: const Text('취소'),
            )
        ],
      ),
    );
  }
}
