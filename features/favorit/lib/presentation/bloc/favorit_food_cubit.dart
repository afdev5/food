import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:favorit/domain/usecase/favorit_usecase.dart';
import 'package:home/domain/entities/food_entity.dart';
import 'package:meta/meta.dart';

part 'favorit_food_state.dart';

class FavoritFoodCubit extends Cubit<FavoritFoodState> {
  final FavoritUseCase favoritUseCase;
  FavoritFoodCubit({required this.favoritUseCase}) : super(FoodInitial());

  Future<void> getFood() async {
    try {
      emit(LoadingFavoritFoodState());
      final response = await favoritUseCase.getFavoritFood();
      print(response);
      if (response.isEmpty) {
        emit(EmptyFavoritFoodState());
      } else {
        emit(SuccessFavoritFoodState(datas: response));
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
