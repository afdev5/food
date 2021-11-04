import 'package:detail/data/datasources/remote_detail_data_source.dart';
import 'package:detail/domain/repositories/detail_repositories.dart';
import 'package:home/domain/entities/food_entity.dart';

class DetailRepositoriesImpl extends DetailRepositories {
  final RemoteDetailDataSource remoteDataSource;
  DetailRepositoriesImpl({required this.remoteDataSource});

  @override
  Future<FoodEntity> getFoodDetail({required String id}) async {
    final food = await remoteDataSource.getFoodDetail(id: id);
    return FoodEntity(
        id: food.data.first.id!,
        title: food.data.first.title!,
        desc: food.data.first.desc ?? "",
        image: food.data.first.image ?? "");
  }
}
