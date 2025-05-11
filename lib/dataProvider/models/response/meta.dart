import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  factory Meta.fromJson(Map<String, dynamic> json) =>
      _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
