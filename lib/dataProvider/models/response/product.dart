import 'package:flutter_project/dataProvider/models/response/review.dart';
import 'package:json_annotation/json_annotation.dart';

import 'dimensions.dart';
import 'meta.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  @JsonKey(name: 'dimensions')
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;

  @JsonKey(name: 'reviews')
  final List<Review>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;

  @JsonKey(name: 'meta')
  final Meta? meta;
  final List<String>? images;
  final String? thumbnail;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
