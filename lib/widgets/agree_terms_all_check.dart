import 'package:flutter/material.dart';
import 'package:valt/styles/color_style.dart';
import 'package:valt/styles/text_style.dart';

class AgreeTermsAllCheck extends StatelessWidget {
  const AgreeTermsAllCheck({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorStyles.gray90;
      }
      return ColorStyles.gray90;
    }

    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 28,
              width: 28,
              child: Transform.scale(
                scale: 1.1,
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) =>
                        const BorderSide(width: 1.0, color: ColorStyles.gray30),
                  ),
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: value,
                  onChanged: (bool? newValue) {
                    onChanged(newValue!);
                  },
                ),
              ),
            ),
            const SizedBox(width: 6),
            Text(label, style: TextStyles.pretendardB18Gray100),
          ],
        ),
      ),
    );
  }
}
