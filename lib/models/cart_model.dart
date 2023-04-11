import 'package:flutter_product_catalog/models/catalog.dart';

class CartModel{
  late CatalogModel _catalog;

  final List<int> id=[];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
   
   assert(newCatalog!=null);
    _catalog=newCatalog;
    }

    List<Items> get items => id.map((id) => _catalog.getItemById(id)).toList();

    num get totalPrice => items.fold(0,(total,current)=> total+ current.price);

    void add(Items item){
      id.add(item.id);

    }
    void remove(Items item)
{
   id.remove(item.id);
}}