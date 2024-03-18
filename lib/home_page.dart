import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'pages/auto_dispose/auto_dispose_page.dart';
import 'pages/caching_async/async_catching_page.dart';
import 'pages/keep_alive/keep_alive_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Riverpod Lifecycle", style: Theme.of(context).textTheme.headlineLarge),
            _KElevatedButton(text: "AutoDispose", onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AutoDisposePage()))),
            _KElevatedButton(text: "KeepAlive", onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const KeepAlivePage()))),
            _KElevatedButton(text: "AsyncCatching", onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CatchingAsyncPage()))),
          ],
        ),
      ),
    );
  }
}

class _KElevatedButton extends StatelessWidget {
  const _KElevatedButton({required this.text, required this.onPressed});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 50),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
          )),
    );
  }
}

void showToast({required String message, position = ToastGravity.CENTER, Color? backgroundColor = Colors.red, bool isCancel = false}) {
  debugPrint('\x1B[33m$message\x1B[0m');
  !isCancel ? Fluttertoast.cancel() : null;
  Fluttertoast.showToast(
    gravity: position,
    msg: message,
    backgroundColor: backgroundColor,
  );
}
