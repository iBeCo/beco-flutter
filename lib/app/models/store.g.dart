// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => new Store(
    json['name'] as String,
    json['id'] as String,
    json['color'] as String,
    json['type'] as String,
    (json['image_url'] as List)?.map((e) => e as String)?.toList(),
    (json['address'] as List)?.map((e) => e as String)?.toList(),
    json['deal_count'] as int,
    json['current_version'] as int,
    json['geo'] == null
        ? null
        : new Map<String, double>.from(json['geo'] as Map),
    json['is_map_available'] as bool,
    json['store_count'] as int,
    json['textcolor'] == null
        ? null
        : new Map<String, String>.from(json['textcolor'] as Map));

abstract class _$StoreSerializerMixin {
  String get name;
  String get id;
  String get color;
  String get type;
  int get current_version;
  Map<String, String> get textcolor;
  Map<String, double> get geo;
  int get store_count;
  int get deal_count;
  List<String> get address;
  bool get is_map_available;
  List<String> get image_url;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'id': id,
        'color': color,
        'type': type,
        'current_version': current_version,
        'textcolor': textcolor,
        'geo': geo,
        'store_count': store_count,
        'deal_count': deal_count,
        'address': address,
        'is_map_available': is_map_available,
        'image_url': image_url
      };
}
