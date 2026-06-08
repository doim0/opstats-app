import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../../styles/app_theme.dart';

class BottomBar extends StatelessWidget {

  const BottomBar({
    super.key,
    required this.selectedIndex,
    required this.isSearchActive,
    required this.onTabSelected,
    required this.onSearchToggle,
    required this.onSearchFocusChanged,
  });

  final int selectedIndex;
  final bool isSearchActive;
  final ValueChanged<int> onTabSelected;
  final ValueChanged<bool> onSearchToggle;
  final ValueChanged<bool> onSearchFocusChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GlassSearchableBottomBar(
      selectedIndex: selectedIndex,
      isSearchActive: isSearchActive,
      onTabSelected: onTabSelected,

      selectedIconColor: colors.primary,
      unselectedIconColor: colors.onSurface.withValues(alpha: 0.7),
      indicatorColor: colors.primary.withValues(alpha: 0.16),

      labelFontSize: 10,
      iconSize: 28,
      iconLabelSpacing: 0,

      quality: GlassQuality.premium,
      interactionBehavior: GlassInteractionBehavior.full,

      glassSettings: LiquidGlassSettings(
        glassColor: colors.surfaceContainerHigh,
        thickness: 30,
        blur: 2,
        chromaticAberration: .01,
        lightAngle: GlassDefaults.lightAngle,
        lightIntensity: .1,
        ambientStrength: 0,
        refractiveIndex: 1.2,
        saturation: 1.2,
        specularSharpness: GlassSpecularSharpness.medium,
      ),

      searchConfig: GlassSearchBarConfig(
        hintText: 'Search Players',
        onSearchToggle: onSearchToggle,
        onSearchFocusChanged: onSearchFocusChanged,
        searchIconColor: colors.onSurface,
        textInputAction: TextInputAction.search,
        autoFocusOnExpand: false,
        showsCancelButton: true,
      ),

      tabs: _bottomTabs(),
    );
  }

  List<GlassBottomBarTab> _bottomTabs() {
    return [
      GlassBottomBarTab(
        label: 'Home',
        icon: Icon(Icons.sports_baseball_outlined, size: 17),
      ),
      GlassBottomBarTab(
        label: 'Ranking',
        icon: Icon(Icons.bar_chart, size: 17),
      ),
      GlassBottomBarTab(
        label: 'Today',
        icon: Icon(Icons.wb_sunny_outlined, size: 17),
      ),
    ];
  }
}
