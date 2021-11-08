import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:detail/domain/usecase/detail_usecase.dart';
import 'package:home/domain/entities/food_entity.dart';
import 'package:meta/meta.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailUseCase detailUseCase;

  DetailBloc({required this.detailUseCase}) : super(DetailInitial());

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is GetFood) {
      yield* _getFood(event);
    } else if (event is InsertAndDeleteFavorit) {
      yield LoadingDetailState();
      FoodEntity _data = event.food.isFav
          ? await _removeFavoritFood(event.food)
          : await _insertFavoritFood(event.food);
      yield SuccessDetailState(data: _data);
    }
  }

  Stream<DetailState> _getFood(GetFood event) async* {
    try {
      yield LoadingDetailState();
      final response = await detailUseCase.getFoodDetail(id: event.id);
      yield SuccessDetailState(data: response);
    } on IOException {
      yield NoInternetConnection(message: 'Tidak ada koneksi internet');
    } on TimeoutException {
      yield NoInternetConnection(message: 'Tidak ada koneksi internet');
    } catch (e) {
      yield Error(message: e.toString());
    }
  }

  Future<FoodEntity> _insertFavoritFood(FoodEntity food) async {
    FoodEntity? _data;
    await detailUseCase.insertFavoritFood(food: food).then((value) {
      _data = FoodEntity(
          id: food.id,
          title: food.title,
          desc: food.desc,
          image: food.image,
          isFav: true);
    }).onError((err, stackTrace) {
      print(err);
    });
    return _data ?? food;
  }

  Future<FoodEntity> _removeFavoritFood(FoodEntity food) async {
    FoodEntity? _data;
    await detailUseCase.removeFavoritFood(id: food.id).then((value) {
      _data = FoodEntity(
          id: food.id,
          title: food.title,
          desc: food.desc,
          image: food.image,
          isFav: false);
    }).onError((error, stackTrace) {
      print(error);
    });
    return _data ?? food;
  }
}
