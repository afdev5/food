import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:home/domain/entities/food_entity.dart';
import 'package:home/domain/usecase/home_usecase.dart';
import 'package:meta/meta.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  final HomeUseCase homeUseCase;
  FoodCubit({required this.homeUseCase}) : super(FoodInitial());

  Future<void> getFoods({String? category}) async {
    try {
      emit(LoadingFoodState());
      // List<FoodModel> res = category != null
      //     ? await ApiService().getFoodsCategory(category: category)
      //     : await ApiService().getFoodsRandom();
      final response = category != null
          ? await homeUseCase.getFoodWithCategory(category: category)
          : await homeUseCase.getFood();
      print(response);
      emit(SuccessFoodsState(datas: response));
    } on IOException {
      emit(NoInternetConnection(message: 'Tidak ada koneksi internet'));
    } on TimeoutException {
      emit(NoInternetConnection(message: 'Tidak ada koneksi internet'));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
