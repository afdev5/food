import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/presentation/bloc/food_cubit.dart';
import 'package:shared/widget/food_card.dart';
import 'package:shared/widget/loading_food_card.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String category = "Dessert";
  @override
  void initState() {
    super.initState();
    Modular.get<FoodCubit>().getFoods(category: category);
    // foodCubit.getFoods(category: "Dessert");
  }

  @override
  Widget build(BuildContext context) {
    // Modular.get<FoodCubit>().getFoods(category: category);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Find good\nFood around you",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                  IconButton(
                      iconSize: 35,
                      icon: Icon(Icons.favorite_border_outlined),
                      onPressed: () {
                        Modular.to.pushNamed('/favorit');
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => FavoritScreen()));
                      }),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
                          Modular.get<FoodCubit>().getFoods(category: category);
                        },
                        child: btnCategory("Dessert")),
                    InkWell(
                        onTap: () {
                          setState(() => category = "Breakfast");
                          Modular.get<FoodCubit>().getFoods(category: category);
                        },
                        child: btnCategory("Breakfast")),
                    InkWell(
                        onTap: () {
                          setState(() => category = "Chicken");
                          Modular.get<FoodCubit>().getFoods(category: category);
                        },
                        child: btnCategory("Chicken")),
                    InkWell(
                        onTap: () {
                          setState(() => category = "Beef");
                          Modular.get<FoodCubit>().getFoods(category: category);
                        },
                        child: btnCategory("Beef")),
                    InkWell(
                        onTap: () {
                          setState(() => category = "Seafood");
                          Modular.get<FoodCubit>().getFoods(category: category);
                        },
                        child: btnCategory("Seafood")),
                    InkWell(
                        onTap: () {
                          setState(() => category = "Vegetarian");
                          Modular.get<FoodCubit>().getFoods(category: category);
                        },
                        child: btnCategory("Vegetarian")),
                  ],
                )),
            const SizedBox(height: 20),
            Flexible(
              child: BlocBuilder<FoodCubit, FoodState>(
                  bloc: Modular.get<FoodCubit>(),
                  builder: (context, state) {
                    if (state is SuccessFoodsState) {
                      print('data ada');
                      return GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 0.95,
                          children: state.datas.map((e) {
                            return InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             DetailScreen(data: e)));
                                  Modular.to.pushNamed('detail', arguments: e);
                                },
                                child: FoodCardWidget(
                                  title: e.title,
                                  image: e.image,
                                ));
                            // child: Text(e.title!));
                          }).toList());
                    } else if (state is NoInternetConnection) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else if (state is Error) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      print('no data');
                      return GridView.builder(
                          itemCount: 6,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
            )
          ],
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
