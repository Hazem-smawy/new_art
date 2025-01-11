import 'package:flutter/material.dart';

class MainIconWidget extends StatelessWidget {
  final IconData icon;
  final bool inHome;
  const MainIconWidget({
    super.key,
    required this.icon,
    required this.inHome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
