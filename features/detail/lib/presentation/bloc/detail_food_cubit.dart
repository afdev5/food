import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:detail/domain/usecase/detail_usecase.dart';
import 'package:home/domain/entities/food_entity.dart';
import 'package:meta/meta.dart';

part 'detail_food_state.dart';

class DetailFoodCubit extends Cubit<DetailFoodState> {
  final DetailUseCase detailUseCase;
  DetailFoodCubit({required this.detailUseCase}) : super(FoodInitial());

  Future<void> getFood({required String id}) async {
    try {
      emit(LoadingDetailFoodState());
      final response = await detailUseCase.getFoodDetail(id: id);
      print(response);
      emit(SuccessDetailFoodState(data: response));
    } on IOException {
      emit(NoInternetConnection(message: 'Tidak ada koneksi internet'));
    } on TimeoutException {
      emit(NoInternetConnection(message: 'Tidak ada koneksi internet'));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  Future<void> insertAndDeleteFavorit({required FoodEntity data}) async {
    emit(LoadingDetailFoodState());
    if (data.isFav) {
      detailUseCase.removeFavoritFood(id: data.id).then((value) {
        emit(SuccessDetailFoodState(
            data: FoodEntity(
                id: data.id,
                title: data.title,
                desc: data.desc,
                image: data.image,
                isFav: false)));
      }).onError((err, stackTrace) {
        print(err);
      });
    } else {
      detailUseCase.insertFavoritFood(food: data).then((value) {
        emit(SuccessDetailFoodState(
            data: FoodEntity(
                id: data.id,
                title: data.title,
                desc: data.desc,
                image: data.image,
                isFav: true)));
      }).onError((err, stackTrace) {
        print(err);
      });
    }
  }
}
