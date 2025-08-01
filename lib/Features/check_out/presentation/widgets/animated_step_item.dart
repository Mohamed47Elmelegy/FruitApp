import 'package:flutter/material.dart';
import 'package:frutes_app/Features/check_out/presentation/widgets/active_pageview_items.dart';
import 'package:frutes_app/Features/check_out/presentation/widgets/notactive_pageview.dart';

class AnimatedStepItem extends StatelessWidget {
  const AnimatedStepItem({
    super.key,
    required this.text,
    required this.index,
    required this.isActive,
    required this.isCompleted,
  });

  final String text;
  final int index;
  final bool isActive;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.5),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: isActive
              ? ActivePageViewItems(
                  key: ValueKey<String>('active- $index'),
                  text: text,
                )
              : isCompleted
                  ? ActivePageViewItems(
                      key: ValueKey<String>('completed- $index'),
                      text: text,
                      isCompleted: true,
                    )
                  : NotActivePageView(
                      key: ValueKey<String>('inactive- $index'),
                      text: text,
                      index: index + 1,
                    ),
        ),
      ),
    );
  }
}
