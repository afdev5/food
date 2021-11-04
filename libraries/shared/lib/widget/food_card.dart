import 'package:flutter/material.dart';

class FoodCardWidget extends StatelessWidget {
  final String title;
  final String? image;
  
  // ignore: use_key_in_widget_constructors
  const FoodCardWidget({this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 130,
              height: 120,
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  image: image == null
                      ? null
                      : DecorationImage(
                          image: NetworkImage(image!),
                          fit: BoxFit.cover)),
              child: image != null
                  ? null
                  : const Icon(
                      Icons.image_not_supported_outlined,
                      size: 40,
                    ),
            ),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}