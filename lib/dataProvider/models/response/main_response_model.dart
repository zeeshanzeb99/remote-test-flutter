import 'package:flutter_project/dataProvider/models/response/category.dart';
import 'package:flutter_project/dataProvider/models/response/product.dart';
import 'package:json_annotation/json_annotation.dart';


part 'main_response_model.g.dart';

@JsonSerializable()
class MainResponseModel {
  MainResponseModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
    this.categories,
  });

  @JsonKey(name: 'products')
  List<Product>? products;
  @JsonKey(name: 'total')
  int? total;
  @JsonKey(name: 'skip')
  int? skip;
  @JsonKey(name: 'limit')
  int? limit;

  @JsonKey(name: 'categories')
  List<Category>? categories;

  factory MainResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MainResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainResponseModelToJson(this);
}
