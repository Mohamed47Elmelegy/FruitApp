import 'package:flutter/material.dart';
import 'package:frutes_app/Features/Home/domain/entity/bottom_navigation_bar_entity.dart';

import 'active_bottom_navigation_items.dart';
import 'not_active_bottom_navigation_items.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.bottomNavigationBarEntity,
      required this.isSelected});
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItems(
            text: bottomNavigationBarEntity.name,
            image: bottomNavigationBarEntity.activeImage,
          )
        : NotActiveItems(
            image: bottomNavigationBarEntity.notActiveImage,
          );
  }
}
