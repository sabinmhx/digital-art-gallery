import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const NavigationButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Text(text),
      ),
    );
  }
}
