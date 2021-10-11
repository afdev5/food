import 'package:flutter/material.dart';
import 'package:food/src/models/food_model.dart';

// ignore: must_be_immutable
class FoodCardWidget extends StatelessWidget {
  FoodCardWidget({this.data});
  FoodModel data;
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Container(
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 12),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  width: 130,
                  height: 120,
                  margin: EdgeInsets.only(bottom: 14),
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
    return Card(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 12),
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
              margin: EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  image: data.image == null
                      ? null
                      : DecorationImage(
                          image: NetworkImage(data.image),
                          fit: BoxFit.cover)),
              child: data.image != null
                  ? null
                  : Icon(
                      Icons.image_not_supported_outlined,
                      size: 40,
                    ),
            ),
            Text(
              data.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
