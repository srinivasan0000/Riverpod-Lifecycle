import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'keep_alive_provider.dart';

class KeepAlivePage extends ConsumerWidget {
  const KeepAlivePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KeepAlive'),
      ),
      body: Center(
        child: Text(
          ref.watch(keepAliveCounterProvider).toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => ref.read(keepAliveCounterProvider.notifier).state++,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
