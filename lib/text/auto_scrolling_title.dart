import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';

class AutoScrollingTitle extends StatelessWidget {
  const AutoScrollingTitle({
    required this.text,
    this.style,
    super.key,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: text, style: style),
          maxLines: 1,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth - 10.w);

        final isOverflowing = textPainter.didExceedMaxLines;

        final height = (style?.fontSize ?? DefaultTextStyle.of(context).style.fontSize ?? 16) * 1.5;
        if (isOverflowing) {
          return SizedBox(
            height: height,
            child: Marquee(
              text: text,
              style: style,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20,
              pauseAfterRound: Duration(seconds: 1),
              accelerationDuration: Duration(seconds: 2),
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          );
        } else {
          return Text(text, style: style, maxLines: 1, overflow: TextOverflow.ellipsis);
        }
      },
    );
  }
}
