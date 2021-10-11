import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/src/cubit/food_cubit.dart';
import 'package:food/src/models/food_model.dart';
import 'package:shimmer/shimmer.dart';

class DetailScreen extends StatefulWidget {
  final FoodModel data;
  final FoodCubit cubit;
  DetailScreen({this.data, this.cubit});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final foodCubit = FoodCubit();
  @override
  void initState() {
    super.initState();
    foodCubit.getFood(id: widget.data.id);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider<FoodCubit>(
      create: (context) => foodCubit,
      child: BlocListener<FoodCubit, FoodState>(
        listener: (context, state) {
          if (state is SuccessFavoritState) {}
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<FoodCubit, FoodState>(
            builder: (context, state) {
              return SafeArea(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        //image
                        Container(
                          height: size.height / 3,
                          width: size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                              image: widget.data.image == null
                                  ? null
                                  : DecorationImage(
                                      image: NetworkImage(widget.data.image),
                                      fit: BoxFit.fill)),
                        ),
                        //Backbtn
                        iconBtn(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 28,
                              color: Colors.black,
                            )),
                        //favorit
                        Positioned(
                          right: 0,
                          child: iconBtn(
                              onTap: () {
                                foodCubit.insertAndDeleteFavorit(
                                    data: state is SuccessFoodState
                                        ? state.data
                                        : widget.data);
                              },
                              icon: Icon(
                                  state is SuccessFoodState && state.data.isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  size: 28,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.white,
                      width: size.width,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data.title,
                              style: TextStyle(
                                  color: Colors.indigo[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Deskripsi :",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            //checking data
                            state is SuccessFoodState
                                ? Text(state.data.desc)
                                : loadingShimmer()
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget loadingShimmer() {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 170,
              height: 14,
              color: Colors.black,
            ),
            SizedBox(height: 5),
            Container(
              width: 150,
              height: 14,
              color: Colors.black,
            ),
            SizedBox(height: 5),
            Container(
              width: 100,
              height: 14,
              color: Colors.black,
            ),
          ],
        ));
  }

  Widget iconBtn({Function onTap, Icon icon}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[200]?.withOpacity(0.8),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
