import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/large_title_scroll_scaffold.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    return LargeTitleScrollScaffold(
      title: 'Home',
      slivers: [
        SliverToBoxAdapter(
            child: CupertinoButton(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
                onPressed: ()=> {print("hello")}
            ),
          )
      ],
    );
  }
}