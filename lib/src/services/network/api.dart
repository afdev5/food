import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/src/models/food_model.dart';

class ApiService {
  Dio _dio;
  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://themealdb.com/api/json/v1/1',
      ),
    );
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<List<FoodModel>> getFoodsRandom() async {
    List<FoodModel> datas = [];
    try {
      var response = await _dio.get('/search.php?f=a');
      print(response);
      response.data['meals'].forEach((e) {
        datas.add(FoodModel.fromMap(e));
      });
    } catch (e) {
      print(e);
    }
    return datas;
  }

  Future<List<FoodModel>> getFoodsCategory({@required String category}) async {
    List<FoodModel> datas = [];
    try {
      var response = await _dio.get('/filter.php?c=$category');
      print(response);
      response.data['meals'].forEach((e) {
        datas.add(FoodModel.fromMap(e));
      });
    } catch (e) {
      print(e);
    }
    return datas;
  }

  Future<FoodModel> getDetailFood({@required String id}) async {
    List<FoodModel> datas = [];
    try {
      var response = await _dio.get('/lookup.php?i=$id');
      print(response);
      response.data['meals'].forEach((e) {
        datas.add(FoodModel.fromMap(e));
      });
    } catch (e) {
      print(e);
    }
    return datas.first;
  }
}
