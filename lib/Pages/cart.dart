import 'package:flutter/material.dart';
import 'package:flutter_product_catalog/models/cart_model.dart';
import 'package:flutter_product_catalog/utils/routes.dart';
import 'package:flutter_product_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(
        title: "Cart".text.xl2.make(),
      ),
      body: Column(
        children: [
          _cartList().p32().expand(),
          Divider(),
          _cartTotal(),
          
        ],
      ),

    );
  }
}
class _cartTotal extends StatelessWidget {
  final CartModel _cart=(VxState.store as MyStore).cart;
   _cartTotal({super.key});
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            mutations: {RemoveMutation},
            builder: (context, MyStore, _) {
              return "\$${_cart.totalPrice}".text.xl4.make();
            },
          ),
           ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported yet".text.make()));
            }, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all(StadiumBorder())
            ),
            child: "Buy".text.make()).w24(context).h4(context)
        ],
      ),
    );
  }
}
class _cartList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart=(VxState.store as MyStore).cart;
    return _cart.items.isEmpty?Column(
      children: [
        "Nothing to Show ".text.xl3.make(),
        TextButton(onPressed: (){
          Navigator.pushNamed(context, MyRoutes.homeRoute);
        }, child: "Shop Now".text.make())
      ],
    ).py64():ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder:(context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing:IconButton(
          onPressed: (){
            RemoveMutation(_cart.items[index]);
            // setState(() {
              
            // });
          },
           icon: Icon(Icons.remove_circle_outline_outlined)),
           title: _cart.items[index].name.text.make(),
      ));
  }}
