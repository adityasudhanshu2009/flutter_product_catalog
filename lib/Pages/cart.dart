import 'package:flutter/material.dart';
import 'package:flutter_product_catalog/models/cart_model.dart';
import 'package:flutter_product_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

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
  final _cart=CartModel();
   _cartTotal({super.key});
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl4.make(),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported yet".text.make()));
            }, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)
            ),
            child: "Buy".text.make()).w24(context)
        ],
      ),
    );
  }
}
class _cartList extends StatefulWidget {

  const _cartList({super.key});

  @override
  State<_cartList> createState() => __cartListState();
}

class __cartListState extends State<_cartList> {
  final _cart=CartModel();
  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder:(context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing:IconButton(
          onPressed: (){},
           icon: Icon(Icons.remove_circle_outline_outlined)),
           title: _cart.items[index].name.text.make(),
      ));
  }
}