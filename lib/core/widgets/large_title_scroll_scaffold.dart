import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LargeTitleScrollScaffold extends StatefulWidget {
  const LargeTitleScrollScaffold({
    super.key,
    required this.title,
    required this.slivers,
    this.threshold = 56,
  });

  final String title;
  final List<Widget> slivers;
  final double threshold;

  @override
  State<LargeTitleScrollScaffold> createState() =>
      _LargeTitleScrollScaffoldState();
}

class _LargeTitleScrollScaffoldState extends State<LargeTitleScrollScaffold> {
  final ScrollController _scrollController = ScrollController();
  bool _showTopTitle = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final shouldShow = _scrollController.offset > widget.threshold;

      if (shouldShow != _showTopTitle) {
        setState(() => _showTopTitle = shouldShow);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final topPadding = MediaQuery.of(context).padding.top;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, topPadding + 24, 20, 12),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),
            ...widget.slivers,
          ],
        ),

        AnimatedOpacity(
          opacity: _showTopTitle ? 1 : 0,
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,
          child: IgnorePointer(
            child: Container(
              height: topPadding + 44,
              color: bgColor.withValues(alpha: 0.92),
            ),
          ),
        ),

        Positioned(
          top: topPadding,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: AnimatedOpacity(
              opacity: _showTopTitle ? 1 : 0,
              duration: const Duration(milliseconds: 160),
              curve: Curves.easeOut,
              child: SizedBox(
                height: 44,
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: colorScheme.onSurface,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
