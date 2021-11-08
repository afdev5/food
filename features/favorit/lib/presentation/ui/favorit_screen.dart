
import 'package:favorit/presentation/bloc/favorit_bloc.dart';
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
    Modular.get<FavoritBloc>().add(GetFoodsEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Favorit Food"),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<FavoritBloc, FavoritState>(
        bloc: Modular.get<FavoritBloc>(),
        builder: (context, state) {
          if (state is SuccessFavoritState) {
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
          } else if (state is EmptyFavoritState) {
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
