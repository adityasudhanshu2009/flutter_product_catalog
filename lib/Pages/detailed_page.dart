// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter_product_catalog/models/catalog.dart';
import 'package:flutter_product_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class detailedHomePage extends StatelessWidget {
  final Items catalog;
  const detailedHomePage({
    Key? key,
    required this.catalog,
  }) :assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.xl3.bold.make(),
                    ElevatedButton(onPressed:() {}, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                    child:"Add to Cart".text.xl.make(), 
                    ).wh(120, 40)
                  ],
                ).p32(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image).h40(context),),
            Expanded(
              child: VxArc(height: 30.0, 
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.bold.make(),
              catalog.desc.text.lg.textStyle(context.captionStyle).make(),
                  "Diam vero eos vero et magna eirmod. Stet lorem sanctus duo dolore sanctus est. Gubergren dolores ipsum et sit sadipscing vero lorem. Sit est invidunt ut ea aliquyam diam dolores. Amet takimata sanctus sadipscing dolores kasd nonumy dolore. No nonumy lorem amet elitr et, erat sea no ea eirmod labore,.".
                  text.sm.textStyle(context.captionStyle).make().p32(),
                  ],
                ).pOnly(top: 50),

              )))
            
          ],
        ),
      ),
    );
  }
}
