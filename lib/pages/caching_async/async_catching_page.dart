import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'async_provider.dart';

class CatchingAsyncPage extends ConsumerStatefulWidget {
  const CatchingAsyncPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CatchingAsyncPageState();
}

class _CatchingAsyncPageState extends ConsumerState<CatchingAsyncPage> {
  @override
  void didChangeDependencies() {
    ref.invalidateIfError(catchingAsyncProductProvider);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AsyncCatching'),
      ),
      body: Container(
        child: ref.watch(catchingAsyncProductProvider).when(
            data: (data) {
              final res = data.products;
              return ListView.builder(
                itemCount: res.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(res[index].description),
                ),
              );
            },
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
