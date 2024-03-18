import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/core/color_palette/color_palette.dart';

class NoticeBarContent extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? trailingText;

  const NoticeBarContent({
    super.key,
    required this.icon,
    required this.text,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 10,top: 2),
      child: Row(
        children: [
          // Icon(
          //   icon,
          //   color: ColorPalette.neutral70,
          // ),
          // const SizedBox(
          //   width: 4,
          // ),
          Expanded(
            child: Text(
              text,
              style: context.labelMedium?.copyWith(),
            ),
          ),
          if (trailingText != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorPalette.neutralVariant99,
              ),
              child: Text(
                trailingText!,
                style: context.labelSmall,
              ),
            ),
        ],
      ),
    );
  }
}
