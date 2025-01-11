import 'package:flutter/material.dart';

class ThinDividerWidget extends StatelessWidget {
  const ThinDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      thickness: 0.3,
    );
  }
}
