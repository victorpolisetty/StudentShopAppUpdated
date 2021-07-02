// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemPage _$ItemPageFromJson(Map<String, dynamic> json) {
  return ItemPage(
    (json['itemList'] as List<dynamic>)
        .map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ItemPageToJson(ItemPage instance) => <String, dynamic>{
      'itemList': instance.itemList,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    json['id'] as String,
    json['name'] as String,
    json['price'] as String,
    json['imageURL'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'name': instance.name,
      'imageURL': instance.imageURL,
      'price': instance.price,
      'description': instance.description,
      'id': instance.id,
    };
