import 'package:detail/data/datasources/local_detail_data_source.dart';
import 'package:detail/data/datasources/remote_detail_data_source.dart';
import 'package:detail/domain/repositories/detail_repositories.dart';
import 'package:home/domain/entities/food_entity.dart';
import 'package:core/db/database_module.dart';

class DetailRepositoriesImpl extends DetailRepositories {
  final RemoteDetailDataSource remoteDataSource;
  final LocalDetailDataSource localDataSource;
  DetailRepositoriesImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<FoodEntity> getFoodDetail({required String id}) async {
    final checkFavorit = await localDataSource.getFavoritFood(id: id);
    final food = await remoteDataSource.getFoodDetail(id: id);
    return FoodEntity(
        id: food.data.first.id!,
        title: food.data.first.title!,
        desc: food.data.first.desc ?? "",
        image: food.data.first.image ?? "",
        isFav: checkFavorit != null ? true : false);
  }

  @override
  Future insertFavoritFood({required FoodEntity food}) async {
    await localDataSource.insertFavoritFood(
        food: FoodTableData(
            id: food.id,
            title: food.title,
            desc: food.desc,
            image: food.image));
  }

  @override
  Future removeFavoritFood({required String id}) async => await localDataSource.removeFavoritFood(id: id);
}
