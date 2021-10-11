import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/src/cubit/food_cubit.dart';
import 'package:food/src/views/screens/detail.dart';
import 'package:food/src/views/widgets/food_card.dart';
import 'package:shimmer/shimmer.dart';

class FavoritScreen extends StatefulWidget {
  @override
  _FavoritScreenState createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  final foodCubit = FoodCubit();
  @override
  void initState() {
    super.initState();
    foodCubit.getFavoritFoods();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodCubit>(
      create: (context) => foodCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your Favorit Food"),
        ),
        body: BlocBuilder<FoodCubit, FoodState>(builder: (context, state) {
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
                                builder: (context) => DetailScreen(data: e)));
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
      ),
    );
  }
}
