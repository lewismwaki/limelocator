import 'package:flutter/material.dart';
import 'package:lime_locator/constants/constants.dart';
import 'package:lime_locator/features/base/models/nav_item.dart';

class NavItemButton extends StatelessWidget {
  const NavItemButton({
    required this.isSelected,
    required this.onTap,
    required this.navItem,
    super.key,
  });

  final VoidCallback onTap;
  final NavItem navItem;
  final bool isSelected;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            navItem.icon,
            color: isSelected ? primaryBlack : primaryBlack.withOpacity(.4),
          ),
          Text(
            navItem.label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
