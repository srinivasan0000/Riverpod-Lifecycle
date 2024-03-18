import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../home_page.dart';

final keepAliveCounterProvider = StateProvider<int>((ref) {
  showToast(
    message: "KeepAliveProvider initialized",
    backgroundColor: Colors.green,
    position: ToastGravity.TOP,
  );
  ref.onAddListener(() {
    showToast(message: "KeepAliveProvider listener added", isCancel: true);
  });
  ref.onRemoveListener(() {
    showToast(message: "KeepAliveProvider listener removed");
  });
  ref.onCancel(() {
    showToast(message: "KeepAliveProvider canceled");
  });
  ref.onDispose(() {
    showToast(message: "KeepAliveProvider disposed");
  });
  ref.onResume(() {
    showToast(message: "KeepAliveProvider resumed");
  });

  return 0;
});
