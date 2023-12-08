import 'package:flutter/material.dart';
import 'package:lime_locator/constants/constants.dart';

class ShadowedIconButton extends StatelessWidget {
  const ShadowedIconButton({
    required this.iconData,
    required this.onPressed,
    this.padding,
    super.key,
  });

  final IconData iconData;
  final VoidCallback onPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
              color: colorScheme.outlineVariant.withOpacity(.8),
            ),
          ],
        ),
        child: IconButton(
          icon: Icon(iconData),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
