import 'package:flutter/material.dart';

class FoodGridView extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  // ignore: use_key_in_widget_constructors
  const FoodGridView({required this.itemCount, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.95, crossAxisCount: 2),
        itemBuilder: itemBuilder);
  }
}
