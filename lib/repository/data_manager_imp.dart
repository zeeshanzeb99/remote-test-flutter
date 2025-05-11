

import '../dataProvider/models/response/category.dart';
import '../dataProvider/models/response/main_response_model.dart';
import '../dataProvider/models/response/product.dart';

abstract class DataManagerImp {
  Future<MainResponseModel> getProducts(int? limit, String title);

  Future <MainResponseModel> searchProduct(String query);

  Future<List<Category>> getCategories();

  Future<List<Product>> getCategoryProducts(String url);

  Future<Product> getProductDetails(int id);

}