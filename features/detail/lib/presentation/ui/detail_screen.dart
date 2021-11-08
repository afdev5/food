import 'package:detail/presentation/bloc/detail_bloc.dart';
import 'package:flutter/cupertino.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/domain/entities/food_entity.dart';
import 'package:shimmer/shimmer.dart';

class DetailScreen extends StatefulWidget {
  final FoodEntity data;
  // ignore: use_key_in_widget_constructors
  const DetailScreen({required this.data});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    Modular.get<DetailBloc>().add(GetFood(id: widget.data.id));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<DetailBloc, DetailState>(
        bloc: Modular.get<DetailBloc>(),
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                _buildImageHeader(size: size, state: state),
                _buildContent(size: size, state: state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent({required Size size, required DetailState state}) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(16),
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
            const SizedBox(height: 15),
            const Text(
              "Deskripsi :",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(height: 5),
            //checking data
            state is SuccessDetailState
                ? Text(state.data.desc)
                : loadingShimmer()
          ],
        ),
      ),
    ));
  }

  Widget _buildImageHeader({required Size size, required DetailState state}) {
    return Stack(
      children: [
        //image
        Container(
          height: size.height / 3,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              image: DecorationImage(
                  image: NetworkImage(widget.data.image), fit: BoxFit.fill)),
        ),
        //Backbtn
        iconBtn(
            onTap: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 28,
              color: Colors.black,
            )),
        //favorit
        Positioned(
          right: 0,
          child: iconBtn(
              onTap: () {
                Modular.get<DetailBloc>().add(InsertAndDeleteFavorit(
                    food: state is SuccessDetailState
                        ? state.data
                        : widget.data));
              },
              icon: Icon(
                  state is SuccessDetailState && state.data.isFav
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  size: 28,
                  color: Colors.black)),
        ),
      ],
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
            const SizedBox(height: 5),
            Container(
              width: 150,
              height: 14,
              color: Colors.black,
            ),
            const SizedBox(height: 5),
            Container(
              width: 100,
              height: 14,
              color: Colors.black,
            ),
          ],
        ));
  }

  Widget iconBtn({required Function() onTap, required Icon icon}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[200]?.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
