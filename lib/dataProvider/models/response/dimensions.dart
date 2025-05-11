import 'package:json_annotation/json_annotation.dart';

part 'dimensions.g.dart';

@JsonSerializable()
class Dimensions {
  Dimensions({this.width, this.height, this.depth});

  final double? width;
  final double? height;
  final double? depth;

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);
  Map<String, dynamic> toJson() => _$DimensionsToJson(this);
}
