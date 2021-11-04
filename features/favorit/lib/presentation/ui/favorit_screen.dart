import 'package:favorit/presentation/bloc/favorit_food_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/domain/entities/food_entity.dart';
import 'package:shared/widget/food_card.dart';
import 'package:shared/widget/food_gridview.dart';
import 'package:shared/widget/loading_food_card.dart';
import 'package:shimmer/shimmer.dart';

class FavoritScreen extends StatefulWidget {
  @override
  _FavoritScreenState createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  @override
  Widget build(BuildContext context) {
    Modular.get<FavoritFoodCubit>().getFood();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Favorit Food"),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<FavoritFoodCubit, FavoritFoodState>(
        bloc: Modular.get<FavoritFoodCubit>(),
        builder: (context, state) {
          if (state is SuccessFavoritFoodState) {
            return FoodGridView(
                itemCount: state.datas.length,
                itemBuilder: (context, i) {
                  FoodEntity e = state.datas[i];
                  return InkWell(
                      onTap: () async {
                        final nav =
                            await Modular.to.pushNamed('detail', arguments: e);
                        setState(() {});
                      },
                      child: FoodCardWidget(
                        title: e.title,
                        image: e.image,
                      ));
                });
          } else if (state is EmptyFavoritFoodState) {
            return const Center(
              child: Text("Belum memiliki favorit food"),
            );
          } else if (state is Error) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return FoodGridView(
                itemCount: 6,
                itemBuilder: (context, i) {
                  return Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: const LoadingFoodCardWidget());
                });
          }
        });
  }
}
