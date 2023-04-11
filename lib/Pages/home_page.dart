// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_product_catalog/Pages/detailed_page.dart';
import 'package:flutter_product_catalog/utils/routes.dart';
import 'package:flutter_product_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    loadData();
  }
  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 1));
    
    final String catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData=await json.decode(catalogJson);
   // print(decodedData);
    var _items=decodedData["products"];
    CatalogModel.items= List.from(_items).map<Items>((item) => Items.fromjson(item)).toList();
    setState(() {
      
    });
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      floatingActionButton: FloatingActionButton(
        onPressed:() => Navigator.pushNamed(context, MyRoutes.cart),
        backgroundColor: Colors.black,
        child: Icon(CupertinoIcons.cart),
        ),
      body:SafeArea(
         child: Container(
          padding: Vx.m20,
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Cataloghead(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().py(16).expand()
              else
               CircularProgressIndicator().centered().expand(),            
            ],
           ),
         ),
       )
    );
  }
}
class Cataloghead extends StatelessWidget {
  const Cataloghead({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catalog App".text.xl4.bold.make(),
              SizedBox(height: 10,),
              "Trending Products".text.xl.make(),
            ],
           );
  }
}
class CatalogList extends StatelessWidget {
  const CatalogList
({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index){
        final catalog=CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>detailedHomePage(catalog: catalog))), 
          child: CatalogItem(catalog:catalog));
      });
  }
}
class CatalogItem extends StatelessWidget {
  final Items catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) :assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Hero(
        tag: Key(catalog.id.toString()),
        child: Row(
          children: [
            Image.network(catalog.image,).box.p12.roundedSM.color(MyTheme.creamcolor).make().p12().w40(context),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [catalog.name.text.lg.bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              12.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.xl.bold.make(),
                  addToCart(),
                ],
              ).pOnly(right: 10),
              ],
            ))
          ],
        ),
      )
    ).white.rounded.square(130).make().py12();
  }
}

class addToCart extends StatefulWidget {
  const addToCart({
    super.key,
  });

  @override
  State<addToCart> createState() => _addToCartState();
}

class _addToCartState extends State<addToCart> {
  bool isAdd=false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:() {
      isAdd=isAdd.toggle();
      setState(() {
        
      });
    }, 
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
      shape: MaterialStateProperty.all(StadiumBorder()),
    ),
    child:isAdd?Icon(Icons.done):"Add".text.make(), 
    );
  }
}
