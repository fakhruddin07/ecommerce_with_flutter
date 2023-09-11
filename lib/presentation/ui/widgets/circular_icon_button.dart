import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const CircularIconButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.grey.shade200,
        child: Icon(
          icon,
          color: Colors.grey,
          size: 16,
        ),
      ),
    );
  }
}