import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Column(
        children: [
          CupertinoTextField(style: TextStyle(color: colorScheme.onSurface)),
          Text("hello world", style: TextStyle(color: colorScheme.onSurface)),
          Text("hello world", style: TextStyle(color: colorScheme.onSurface)),
        ],
      ),
    );
  }
}
