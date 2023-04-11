import 'package:velocity_x/velocity_x.dart';

import '../models/cart_model.dart';
import '../models/catalog.dart';

class MyStore extends VxStore{
 late CatalogModel catalog;
 late CartModel cart;

 MyStore(){
  catalog=CatalogModel();
  cart=CartModel();
  cart.catalog=catalog;
 }


}