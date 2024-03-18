import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_lifecycle/home_page.dart';

class AutoDisposeCounterNotifier extends AutoDisposeNotifier<int> {
  @override
  build() {
    showToast(
      message: "AutoDisposeProvider initialized",
      backgroundColor: Colors.green,
      position: ToastGravity.TOP,
    );

    ref.onAddListener(() {
      showToast(message: "AutoDisposeProvider listener added", isCancel: true);
    });
    ref.onRemoveListener(() {
      showToast(message: "AutoDisposeProvider listener removed");
    });
    ref.onCancel(() {
      showToast(message: "AutoDisposeProvider canceled");
    });
    ref.onDispose(() {
      showToast(message: "AutoDisposeProvider disposed");
    });
    ref.onResume(() {
      showToast(message: "AutoDisposeProvider resumed");
    });

    return 0;
  }

  void increment() => state++;
}

final autoDisposeCounterProvider = NotifierProvider.autoDispose<AutoDisposeCounterNotifier, int>(AutoDisposeCounterNotifier.new);
