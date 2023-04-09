import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';


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
       body:SafeArea(
         child: Container(
          padding: Vx.m20,
           child: Column(
            children: [
              "Catalog App".text.xl3.bold.make(),
              "Trending Products".text.xl2.make(),
            ],
           ),
         ),
       )
    );
  }
}