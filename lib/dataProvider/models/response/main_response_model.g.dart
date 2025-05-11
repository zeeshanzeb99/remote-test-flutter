// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainResponseModel _$MainResponseModelFromJson(Map<String, dynamic> json) =>
    MainResponseModel(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      skip: (json['skip'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MainResponseModelToJson(MainResponseModel instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
      'categories': instance.categories,
    };
