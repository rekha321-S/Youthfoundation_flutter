import 'package:flutter/material.dart';
import 'package:youthfoundationofindia/design_systems/colors/colors.dart';
import 'package:youthfoundationofindia/design_systems/typography/text_styles.dart';

class TextLinkButton extends StatelessWidget {
  const TextLinkButton.light(this.text, this.onTap, {super.key})
      : color = AppColors.neutral900;

  const TextLinkButton.dark(this.text, this.onTap, {super.key})
      : color = Colors.white;
  final VoidCallback onTap;
  final String text;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: TextButton(
        onPressed: onTap,
        // style: ButtonStyle(
        //   minimumSize: null,
        //   padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 12)),
        //   overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        //   foregroundColor: WidgetStateProperty.resolveWith<Color>(
        //     (Set<WidgetState> states) {
        //       if (states.contains(WidgetState.hovered)) {
        //         return AppColors.primary600;
        //       }

        //       if (states.contains(WidgetState.pressed)) {
        //         return AppColors.primary600;
        //       }

        //       return color;
        //     },
        //   ),
        // ),
        child: Text(text, style: AppTextStyles.bodySmallSemiBold),
      ),
    );
  }
}
