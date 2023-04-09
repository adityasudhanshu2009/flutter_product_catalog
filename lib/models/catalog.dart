// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel{
  static List<Items> items=[];
}
class Items {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  Items({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  factory Items.fromjson(Map <dynamic,dynamic> map){
    return Items(
      id: map["id"],
      name: map["name"],
      desc: map["desc"], 
      price: map["price"], 
      color: map["color"], 
      image: map["image"]);

  }
  toMap()=>{
    "id" :id,
    "name" :name,
    "desc" :desc,
    "price" :price,
    "color" :color,
    "image" :image,

  };
}



  
