import 'package:bloc/bloc.dart';
import 'package:food/src/models/food_model.dart';
import 'package:food/src/services/network/api.dart';
import 'package:meta/meta.dart';
import 'package:food/src/services/db/moor_database.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFoods({String category}) async {
    emit(LoadingFoodState());
    List<FoodModel> res = category != null
        ? await ApiService().getFoodsCategory(category: category)
        : await ApiService().getFoodsRandom();
    emit(SuccessFoodsState(datas: res));
  }

  Future<void> getFood({String id}) async {
    emit(LoadingFoodState());
    FoodModel res = await ApiService().getDetailFood(id: id);
    // var check = await AppDatabase().getFood(id);
    // print(check);
    //check food favorit
    // if (check != null) {
    //   print("Is Fav");
    //   res = res.copyWith(isFav: true);
    // }
    emit(SuccessFoodState(data: res));
  }

  Future<void> getFavoritFoods() async {
    emit(LoadingFoodState());
    List<FoodModel> datas = [];
    // var respon = await AppDatabase().getAllFoods();
    // respon.forEach((element) {
    //   datas.add(FoodModel(
    //       id: element.id,
    //       title: element.title,
    //       image: element.image,
    //       desc: element.desc,
    //       isFav: true));
    // });
    emit(SuccessFoodsState(datas: datas));
  }

  Future<void> insertAndDeleteFavorit({FoodModel data}) async {
    // emit(LoadingFoodState());
    // var check = await AppDatabase().getFood(data.id);
    // if (check != null) {
    //   AppDatabase().deleteFood(data.id).then((value) {
    //     emit(SuccessFavoritState());
    //     emit(SuccessFoodState(data: data.copyWith(isFav: false)));
    //   }).onError((error, stackTrace) {
    //     print(error);
    //   });
    // } else {
    //   AppDatabase()
    //       .insertFood(DbFood(
    //           id: data.id,
    //           title: data.title,
    //           image: data.image,
    //           desc: data.desc ?? ""))
    //       .then((value) {
    //     emit(SuccessFavoritState());
    //     emit(SuccessFoodState(data: data.copyWith(isFav: true)));
    //   }).onError((error, stackTrace) {
    //     print(error);
    //   });
    // }
  }
}
