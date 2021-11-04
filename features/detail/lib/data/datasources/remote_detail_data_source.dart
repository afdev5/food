import 'package:home/data/models/food_response_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteDetailDataSource {
  Future<FoodResponseModel> getFoodDetail({required String id});
}

class RemoteDetailDataSourceImpl extends RemoteDetailDataSource {
  final Dio dio;
  final String baseUrl = 'https://themealdb.com/api/json/v1/1';
  RemoteDetailDataSourceImpl({required this.dio});
  @override
  Future<FoodResponseModel> getFoodDetail({required String id}) async {
    try {
      final response = await dio.get('/lookup.php?i=$id');
      return FoodResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw (e.error);
    }
  }
}
