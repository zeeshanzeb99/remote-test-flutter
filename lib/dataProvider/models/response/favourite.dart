import 'package:json_annotation/json_annotation.dart';
part 'favourite.g.dart';

@JsonSerializable()
class Favourite {
  Favourite({
    this.id,
    this.title,
    this.price,
    this.rating,
  });

  final int? id;
  final String? title;
  final double? price;
  final double? rating;


  factory Favourite.fromJson(Map<String, dynamic> json) =>
      _$FavouriteFromJson(json);
  Map<String, dynamic> toJson() => _$FavouriteToJson(this);
}
