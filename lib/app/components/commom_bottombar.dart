import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<CustomBottomNavigationBarItem> items;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: items.map((item) => item.buildBottomNavigationBarItem()).toList(),
    );
  }
}

class CustomBottomNavigationBarItem {
  final IconData iconData;
  final Color selectedColor;
  final Color unselectedColor;
  final String label;
  final bool selected;

  CustomBottomNavigationBarItem(
      {required this.iconData,
      required this.selectedColor,
      required this.unselectedColor,
      required this.label,
      required this.selected});

  BottomNavigationBarItem buildBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: selected ? selectedColor : unselectedColor,
      ),
      label: label,
    );
  }
}
