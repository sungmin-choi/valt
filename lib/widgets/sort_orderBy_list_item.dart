import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';

class SortOrderByListItem extends StatefulWidget {
  const SortOrderByListItem(
      {super.key,
      required this.text,
      required this.handelClick,
      required this.isActive});

  final String text;
  final bool isActive;
  final Function() handelClick;

  @override
  State<SortOrderByListItem> createState() => _SortOrderByListItemState();
}

class _SortOrderByListItemState extends State<SortOrderByListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 11,
        ),
        GestureDetector(
          onTap: () {
            widget.handelClick();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: widget.isActive
                    ? TextStyles.pretendardN16Gray90w700
                    : TextStyles.pretendardN16Gray60w400,
              ),
              if (widget.isActive)
                const Icon(
                  Icons.check,
                  color: Colors.black,
                )
            ],
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        const Divider(
          thickness: 1,
          height: 1,
          color: ColorStyles.gray30,
        )
      ],
    );
  }
}
