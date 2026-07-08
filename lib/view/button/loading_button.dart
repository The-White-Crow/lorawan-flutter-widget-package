import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_widget_package/provider/action_button_controller_provider.dart';

class LoadingButton extends ConsumerWidget {
  const LoadingButton({
    this.onPressed,
    this.asyncOnPressed,
    this.provider,
    this.title,
    this.child,
    this.isLoading = false,
    this.isDisabled = false,
    this.textStyle,
    this.height,
    this.width,
    this.textDirection,
    super.key,
  });

  final String? title;
  final Widget? child;
  final bool isLoading;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final Future<void> Function()? asyncOnPressed;
  final StateNotifierProvider<ActionButtonController, bool>? provider;

  final double? width;
  final double? height;
  final bool isDisabled;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    assert(
      (provider == null && asyncOnPressed == null && onPressed != null) ||
          (provider != null && asyncOnPressed != null && onPressed == null),
      'You must either:\n'
      '- Provide only `onPressed`, OR\n'
      '- Provide both `provider` and `asyncOnPressed` (but not `onPressed`).',
    );

    final isLoading = provider != null ? ref.watch(provider!) : false;
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      height: height,
      child: Directionality(
        textDirection: textDirection ?? TextDirection.rtl,
        child: FilledButton.icon(
          onPressed: isDisabled
              ? null
              : () async {
                  if (provider != null) {
                    await ref.read(provider!.notifier).run(() async {
                      if (!isDisabled && asyncOnPressed != null) {
                        await asyncOnPressed!();
                      }
                    });
                  } else {
                    onPressed?.call();
                  }
                },
          icon: isLoading ? CircularProgressIndicator(color: colors.primaryFixed) : child,
          label: Text(
            title ?? '',
            style: textStyle ?? Theme.of(context).textTheme.labelMedium?.copyWith(color: colors.primaryFixed),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
