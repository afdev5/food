import 'package:flutter/material.dart';

class LoadingFoodCardWidget extends StatelessWidget {
  const LoadingFoodCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                width: 130,
                height: 120,
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25))),
            Container(
              width: 75,
              height: 14,
              color: Colors.black,
            ),
          ],
        ));
  }
}
