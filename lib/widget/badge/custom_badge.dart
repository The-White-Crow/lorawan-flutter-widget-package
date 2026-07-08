import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    required this.title,
    this.color,
    this.padding,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.border = 0,
    this.width,
    this.height,
    this.icon,
    super.key,
  });

  final EdgeInsets? padding;
  final String title;
  final double? width;
  final Color? backgroundColor;
  final double border;
  final Color? color;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? height;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? color?.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(border),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[icon!, SizedBox(width: 4)],
            Text(
              title,
              style:
                  textStyle ??
                  TextStyle(
                    fontSize: 10.sp,
                    color: textColor ?? color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
