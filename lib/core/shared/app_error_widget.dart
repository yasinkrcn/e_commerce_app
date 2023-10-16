import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final Widget? child;
  const AppErrorWidget({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child ?? const Center(child: Icon(Icons.error));
  }
}
