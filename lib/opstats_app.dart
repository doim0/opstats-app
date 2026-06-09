import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opstats/features/home/presentation/pages/home_page.dart';
import 'package:opstats/router/widgets/bottom_bar.dart';

import 'router/provider/bottom_bar_provider.dart';
import 'router/provider/theme_mode_provider.dart';
import 'core/theme/app_theme.dart';

class OpstatsApp extends ConsumerWidget {
  const OpstatsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bodies = [
      const Center(child: HomePage()),
      const Center(child: Text('Hello From Favorite')),
      const Center(child: Text('Hello From Settings')),
    ];
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    final isSearchActive = ref.watch(searchActiveProvider);
    final themeMode = ref.watch(themeModeProvider);

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp(
          theme: AppTheme.lightTheme(lightDynamic),
          darkTheme: AppTheme.darkTheme(darkDynamic),
          themeMode: themeMode,
          home: Scaffold(
            extendBody: true,
            bottomNavigationBar: BottomBar(
              selectedIndex: indexBottomNavbar,
              isSearchActive: isSearchActive,
              onTabSelected: (int value) {
                ref
                    .read(indexBottomNavbarProvider.notifier)
                    .update((state) => value);
              },
              onSearchToggle: (bool value) {
                ref
                    .read(searchActiveProvider.notifier)
                    .update((state) => value);
              },
              onSearchFocusChanged: (bool value) {
                ref
                    .read(searchActiveProvider.notifier)
                    .update((state) => value);
              },
            ),
            body: bodies[indexBottomNavbar],
          ),
        );
      },
    );
  }
}
