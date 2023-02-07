import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';

class AgreeTermsCheckList extends StatelessWidget {
  const AgreeTermsCheckList({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              onChanged(!value);
            },
            child: Row(
              children: [
                IconButton(
                    color: value ? ColorStyles.gray100 : ColorStyles.gray50,
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    constraints: const BoxConstraints(),
                    iconSize: 17.0,
                    onPressed: () {
                      onChanged(!value);
                    },
                    icon: const Icon(Icons.check)),
                Text(label.toString())
              ],
            ),
          ),
          IconButton(
              iconSize: 28.0,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {},
              color: ColorStyles.gray50,
              icon: const Icon(Icons.chevron_right_sharp))
        ],
      ),
    );
  }
}
