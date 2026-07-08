import 'package:flutter/material.dart';
import 'package:flutter_core_package/flutter_core_package.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollableContentWidget extends StatelessWidget {
  const ScrollableContentWidget({required this.content, super.key});

  final String content;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      interactive: true,
      thumbVisibility: true,
      trackVisibility: true,
      thickness: 6.w,
      trackColor: context.colorScheme.surfaceDim,
      thumbColor: context.colorScheme.surfaceTint,
      trackRadius: Radius.circular(AppDimens.borderRadius),
      radius: Radius.circular(AppDimens.borderRadius),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: SingleChildScrollView(
          child: Text(
            content,
            textAlign: TextAlign.justify,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}
