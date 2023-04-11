import 'package:flutter_product_catalog/core/store.dart';
import 'package:flutter_product_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

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
}

class AddMutation extends VxMutation<MyStore>{
  final Items item;

  AddMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store?.cart.id.add(item.id);
  }

}
class RemoveMutation extends VxMutation<MyStore>{
  final Items item;

  RemoveMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store?.cart.id.remove(item.id);
  }

}