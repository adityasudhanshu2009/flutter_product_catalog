import 'package:flutter/material.dart';
import 'package:flutter_product_catalog/utils/routes.dart';
import 'package:flutter_product_catalog/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pages/home_page.dart';
import 'Pages/login_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes:{
        "/":(context)=>LoginPage(),
        MyRoutes.loginRoute:(context) => LoginPage(),
        MyRoutes.homeRoute:(context) => HomePage(),

      },
    );

  }
}