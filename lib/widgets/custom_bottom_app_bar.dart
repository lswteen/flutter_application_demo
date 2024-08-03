// lib/widgets/custom_bottom_app_bar.dart
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.primary,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Bottom App Bar',
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}