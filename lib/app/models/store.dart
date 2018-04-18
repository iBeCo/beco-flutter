import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

/**
 * https://flutter.io/json/
 */

@JsonSerializable()
class Store extends Object with _$StoreSerializerMixin {
  final String name;
  final String id;
  final String color;
  final String type;
  final int current_version;
  final Map<String, String> textcolor;
  final Map<String, double> geo;
  final int store_count;
  final int deal_count;
  final List<String> address;
  final bool is_map_available;
  final List<String> image_url;

  Store(
      this.name,
      this.id,
      this.color,
      this.type,
      this.image_url,
      this.address,
      this.deal_count,
      this.current_version,
      this.geo,
      this.is_map_available,
      this.store_count,
      this.textcolor);

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Store.map(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        type = map['type'],
        color = map['color'],
        image_url = map['image_url'],
        address = map['address'],
        deal_count = map['deal_count'],
        store_count = map['store_count'],
        current_version = map['current_version'],
        geo = map['geo'],
        textcolor = map['textcolor'],
        is_map_available = map['is_map_available'];

  String getImageUrl() {
    return image_url[0] + image_url[1];
  }

}
