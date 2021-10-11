import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/src/cubit/food_cubit.dart';
import 'package:food/src/views/screens/detail.dart';
import 'package:food/src/views/screens/favorit.dart';
import 'package:food/src/views/widgets/food_card.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final foodCubit = FoodCubit();
  String category = "Dessert";
  @override
  void initState() {
    super.initState();
    foodCubit.getFoods(category: "Dessert");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodCubit>(
      create: (context) => foodCubit,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Find good\nFood around you",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    IconButton(
                        iconSize: 35,
                        icon: Icon(Icons.favorite_border_outlined),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FavoritScreen()));
                        }),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() => category = "Dessert");
                            foodCubit.getFoods(category: category);
                          },
                          child: btnCategory("Dessert")),
                      InkWell(
                          onTap: () {
                            setState(() => category = "Breakfast");
                            foodCubit.getFoods(category: category);
                          },
                          child: btnCategory("Breakfast")),
                      InkWell(
                          onTap: () {
                            setState(() => category = "Chicken");
                            foodCubit.getFoods(category: category);
                          },
                          child: btnCategory("Chicken")),
                      InkWell(
                          onTap: () {
                            setState(() => category = "Beef");
                            foodCubit.getFoods(category: category);
                          },
                          child: btnCategory("Beef")),
                      InkWell(
                          onTap: () {
                            setState(() => category = "Seafood");
                            foodCubit.getFoods(category: category);
                          },
                          child: btnCategory("Seafood")),
                      InkWell(
                          onTap: () {
                            setState(() => category = "Vegetarian");
                            foodCubit.getFoods(category: category);
                          },
                          child: btnCategory("Vegetarian")),
                    ],
                  )),
              SizedBox(height: 20),
              Flexible(
                child: BlocBuilder<FoodCubit, FoodState>(
                    builder: (context, state) {
                  if (state is SuccessFoodsState) {
                    return GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 0.95,
                        children: state.datas.map((e) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailScreen(data: e)));
                              },
                              child: FoodCardWidget(data: e));
                        }).toList());
                  } else {
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      children: [
                        Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: FoodCardWidget()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: FoodCardWidget()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: FoodCardWidget()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: FoodCardWidget()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: FoodCardWidget()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: FoodCardWidget()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: FoodCardWidget()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: FoodCardWidget()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: FoodCardWidget()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: FoodCardWidget()),
                      ],
                    );
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget btnCategory(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 6, left: 6),
      width: 100,
      decoration: BoxDecoration(
        color: title.toLowerCase() == category.toLowerCase()
            ? Colors.blue
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
          child: Text(title, style: TextStyle(fontWeight: FontWeight.w500))),
    );
  }
}
