import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../models/cart_model.dart';
import '../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Items catalog;
   AddToCart({
    super.key, required this.catalog,
  });
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart=(VxState.store as MyStore).cart;
    bool isInCart=_cart.items.contains(catalog)?true:false;
    return ElevatedButton(onPressed:() {
     
      if(!isInCart){
      AddMutation(catalog);
      // setState(() {
        
      // });
      }
    }, 
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
      shape: MaterialStateProperty.all(StadiumBorder()),
    ),
    child:isInCart?Icon(Icons.done):"Add".text.make(), 
    );
  }
}