// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel{
  static final items=[
    Items(id: 1,
    name:"Iphone 12",
    desc: "Apple Iphone 12",
    price: 999, color: "#3ff345",
    imageurl: "https://zshop.vn/images/thumbnails/1509/1112/detailed/60/iphone-12-pro-graphite-hero.png")

  ];
}
class Items {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageurl;
  Items({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.imageurl,
  });



  Items copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? imageurl,
  }) {
    return Items(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      imageurl: imageurl ?? this.imageurl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'imageurl': imageurl,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      imageurl: map['imageurl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Items(id: $id, name: $name, desc: $desc, price: $price, color: $color, imageurl: $imageurl)';
  }

  @override
  bool operator ==(covariant Items other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.price == price &&
      other.color == color &&
      other.imageurl == imageurl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      color.hashCode ^
      imageurl.hashCode;
  }
}
