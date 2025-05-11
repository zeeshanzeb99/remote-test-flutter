import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/response/main_response_model.dart';

part 'network_api_client.g.dart';

@RestApi()
abstract class NetworkApiClient {
  factory NetworkApiClient(Dio dio, {String baseUrl}) = _NetworkApiClient;

  @GET("products")
  Future<MainResponseModel> getProducts(@Query('limit') int? limit,
      @Query('title') String? title);

  @GET("products/search")
  Future<MainResponseModel> searchProduct(@Query('q') String? query);

  @GET("products/categories")
  Future<MainResponseModel> getCategories();


}
