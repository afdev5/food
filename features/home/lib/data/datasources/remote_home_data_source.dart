import 'package:home/data/models/food_response_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteHomeDataSource {
  Future<FoodResponseModel> getFood();
  Future<FoodResponseModel> getFoodWithCategory({required String category});
}

class RemoteHomeDataSourceImpl extends RemoteHomeDataSource {
  final Dio dio;
  RemoteHomeDataSourceImpl({required this.dio});
  @override
  Future<FoodResponseModel> getFood() async {
    try {
      final response = await dio.get('/search.php?f=a');
      return FoodResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.error);
    }
  }

  @override
  Future<FoodResponseModel> getFoodWithCategory(
      {required String category}) async {
    try {
      // final response = await dio.get('$baseUrl/filter.php?c=$category');
      final response = await dio.get('/filter.php?c=$category');
      return FoodResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.error);
    }
  }
}
