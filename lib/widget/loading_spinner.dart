import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinner extends ConsumerWidget {
  const LoadingSpinner({
    super.key,
    this.size = 20,
    this.color,
    this.lineWidth,
  });

  final double? size;
  final double? lineWidth;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: lineWidth ?? 3,
          color: color ?? colors.primary,
        ),
        // SpinKitDualRing(
        //   lineWidth: lineWidth ?? 3,
        //   color: color ?? colors.primary,
        // ),
      ),
    );
  }
}
