import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../home_page.dart';

import 'models/product.dart';

extension CacheForExtension on AutoDisposeRef<Object?> {
  void cacheFor(Duration duration) {
    Timer? timer;
    final link = keepAlive();
    onCancel(() {
      timer = Timer(duration, () {
        link.close();
      });
    });

    onResume(() => timer?.cancel());
    onDispose(() => timer?.cancel());
  }
}

extension WidgetRefExtension on WidgetRef {
  void invalidateIfError<T>(ProviderBase<AsyncValue<T>> provider) {
    if (read(provider).hasError) {
      invalidate(provider);
    }
  }
}

class CatchingProductsNotifier extends AutoDisposeAsyncNotifier<Products> {
  @override
  FutureOr<Products> build() async {
    showToast(
      message: "CatchingProvider(5sec) initialized",
      backgroundColor: Colors.green,
      position: ToastGravity.TOP,
    );
    Timer? timer;
    final keepAliveLink = ref.keepAlive();

    ref.onAddListener(() {
      showToast(message: "CatchingProvider(5sec) listener added", isCancel: true);
    });
    ref.onRemoveListener(() {
      showToast(message: "CatchingProvider(5sec) listener removed");
    });
    ref.onCancel(() {
      showToast(message: "CatchingProvider(5sec) canceled");
      timer = Timer(const Duration(seconds: 10), () {
        keepAliveLink.close();
      });
    });

    ref.onDispose(() {
      showToast(message: "CatchingProvider(5sec) disposed");
      timer?.cancel();
    });
    ref.onResume(() {
      showToast(message: "CatchingProvider(5sec) resumed");
      timer?.cancel();
    });

    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    // keepAliveLink;
    final products = Products.fromJson(response.body);

    return products;
  }
}

final catchingAsyncProductProvider = AsyncNotifierProvider.autoDispose<CatchingProductsNotifier, Products>(
  () {
    return CatchingProductsNotifier();
  },
);



//for your reference[FutureProvider]

// final cachingFutureProvider = FutureProvider.autoDispose<Products>((ref) async {
//   ref.onAddListener(() {
//     print("cachingFutureProvider listener added");
//   });
//   ref.onCancel(() {
//     print("cachingFutureProvider canceled");
//   });
//   ref.onResume(() {
//     print("cachingFutureProvider resumed");
//   });
//   ref.onRemoveListener(() {
//     print("cachingFutureProvider listener removed");
//   });
//   ref.onDispose(() {
//     print("cachingFutureProvider disposed");
//   });

//   final response = await http.get(Uri.parse('https://dummyjson.com/products'));

//   ref.cacheFor(const Duration(seconds: 10));
//   final products = Products.fromJson(response.body);
//   return products;
// });
