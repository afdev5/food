import 'package:favorit/presentation/bloc/favorit_food_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/widget/food_card.dart';
import 'package:shared/widget/loading_food_card.dart';
import 'package:shimmer/shimmer.dart';

class FavoritScreen extends StatefulWidget {
  @override
  _FavoritScreenState createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  @override
  void initState() {
    super.initState();
    Modular.get<FavoritFoodCubit>().getFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Favorit Food"),
      ),
      body: BlocBuilder<FavoritFoodCubit, FavoritFoodState>(
          bloc: Modular.get<FavoritFoodCubit>(),
          builder: (context, state) {
            if (state is SuccessFavoritFoodState) {
              return GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.95,
                  children: state.datas.map((e) {
                    return InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DetailScreen(data: e)));
                        },
                        child: FoodCardWidget(
                          title: e.title,
                          image: e.image,
                        ));
                  }).toList());
            } else if (state is EmptyFavoritFoodState) {
              return const Center(
                child: Text("Belum memiliki food favorit"),
              );
            } else if (state is Error) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return GridView.builder(
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.9, crossAxisCount: 2),
                  itemBuilder: (context, i) {
                    return Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey.shade100,
                        enabled: true,
                        child: const LoadingFoodCardWidget());
                  });
            }
          }),
    );
  }
}
