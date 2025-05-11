

import 'package:dio/dio.dart';
import 'package:flutter_project/dataProvider/models/response/main_response_model.dart';
import 'package:flutter_project/dataProvider/models/response/product.dart';

import '../dataProvider/models/response/category.dart';
import '../dataProvider/network/mock_api_client.dart';
import '../dataProvider/network/network_api_client.dart';
import '../helper/util/utils.dart';
import 'data_manager_imp.dart';

class DataManager implements DataManagerImp {
  late final MockApiClient _mockApiClient;
  late final NetworkApiClient _networkApiClient;

  DataManager(
      {required MockApiClient mockApiClient,
        required NetworkApiClient networkApiClient}) {
    _mockApiClient = mockApiClient;
    _networkApiClient = networkApiClient;
  }

  @override
  Future<MainResponseModel> getProducts(int? limit,String title) {
    return _networkApiClient
        .getProducts(limit,title)
        .then((successResponse) => successResponse)
        .catchError((e) {
      switch (e.runtimeType) {
        case DioException:
          return errorHandling(e);
        default:
          Utils.console("Exception: $e");
      }
    });
  }

  @override
  Future<MainResponseModel> searchProduct(String query) {
    return _networkApiClient
        .searchProduct(query)
        .then((successResponse) => successResponse)
        .catchError((e) {
      switch (e.runtimeType) {
        case DioException:
          return errorHandling(e);
        default:
          Utils.console("Exception: $e");
      }
    });
  }

  @override
  Future<Product> getProductDetails(int id) async {
    print('PRODUCT ID: $id');
    final url = 'https://dummyjson.com/products/$id';
    final response = await Dio().get(url);
    print('RESPONSE: ${response.data}');

    if (response.statusCode == 200) {
      return Product.fromJson(response.data);
    } else {
      throw Exception('Failed to load product details');
    }
  }


  @override
  Future<List<Category>> getCategories() async {
    final response = await Dio().get('https://dummyjson.com/products/categories');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((e) => Category.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Future<List<Product>> getCategoryProducts(String url) async {
    print('********* $url');
    final response = await Dio().get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['products'];
      return data.map((e) => Product.fromJson(e)).toList();
      // final List<dynamic> data = response.data;
      // return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  // @override
  // Future<MainResponseModel> getCategories() {
  //   return _networkApiClient
  //       .getCategories()
  //       .then((successResponse) => successResponse)
  //       .catchError((e) {
  //     switch (e.runtimeType) {
  //       case DioException:
  //         return errorHandling(e);
  //       default:
  //         Utils.console("Exception: $e");
  //     }
  //   });
  // }


  MainResponseModel errorHandling(DioError e) {
    return MainResponseModel();
    final errorResponse = e.response;
    // if (errorResponse?.data != null) {
    //   var jsonResponse = MainResponseModel.fromJson(errorResponse?.data);
    //   return MainResponseModel(
    //       response: ResponseModel(
    //           message: jsonResponse.response.message,
    //           status: jsonResponse.response.status,
    //           errorCode: errorResponse?.statusCode));
    // } else {
    //   return MainResponseModel(
    //       response: ResponseModel(
    //           message: StringsResource.STR_STH_WRONG,
    //           status: false,
    //           errorCode: errorResponse?.statusCode));
    // }
  }

}