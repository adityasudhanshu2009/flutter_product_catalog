import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_product_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Items item;

   const ItemWidget({Key? key, required this.item}):assert(item!=null),super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Color.fromARGB(255, 216, 235, 245),
      child: ListTile(
        onTap: () {
          print("Item has been pressed"
          );
        },
        leading: Image.network(item.image,),
        title: Text(item.name,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.0,),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
        textScaleFactor: 1.2,
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
        
        
      ),
    );
  }
}