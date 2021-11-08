import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:home/domain/entities/food_entity.dart';
import 'package:home/domain/usecase/home_usecase.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final HomeUseCase homeUseCase;

  FoodBloc({required this.homeUseCase}) : super(FoodInitial());
  
  @override
  Stream<FoodState> mapEventToState(
    FoodEvent event,
  ) async* {
    if (event is GetFoodsEvent) {
      try {
        yield LoadingFoodState();
        final response = event.category != null
            ? await homeUseCase.getFoodWithCategory(category: event.category!)
            : await homeUseCase.getFood();
        print(response);
        yield SuccessFoodsState(datas: response);
      } on IOException {
        yield NoInternetConnection(message: 'Tidak ada koneksi internet');
      } on TimeoutException {
        yield NoInternetConnection(message: 'Tidak ada koneksi internet');
      } catch (e) {
        yield Error(message: e.toString());
      }
    }
  }
}
