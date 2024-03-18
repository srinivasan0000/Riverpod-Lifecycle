import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auto_dispose_provider.dart';

class AutoDisposePage extends ConsumerWidget {
  const AutoDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(autoDisposeCounterProvider, (previous, next) {
      if (next % 4 == 0) {
        showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(title: Text("$next is divisile by 4")),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, ref, child) {
          final counter = ref.watch(autoDisposeCounterProvider);
          return Center(
            child: Text(counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () =>
              ref.read(autoDisposeCounterProvider.notifier).increment()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

void showToast() {}
