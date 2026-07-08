import 'package:flutter_riverpod/legacy.dart';

class ActionButtonController extends StateNotifier<bool> {
  ActionButtonController() : super(false);

  Future<void> run(Future<void> Function() action) async {
    if (state) return;
    state = true;
    try {
      await action();
    } finally {
      state = false;
    }
  }
}

final actionButtonControllerProvider = StateNotifierProvider.family<ActionButtonController, bool, String>((ref, key) {
  return ActionButtonController();
});
