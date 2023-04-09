import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyTheme{
  static ThemeData lightTheme(BuildContext context)=>ThemeData(
        primarySwatch:Colors.blueGrey,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black), toolbarTextStyle: Theme.of(context).textTheme.bodyText2, titleTextStyle: Theme.of(context).textTheme.headline6
        )
      );
      static ThemeData darkTheme(BuildContext context)=>
        ThemeData(brightness: Brightness.dark);

      static Color creamcolor=Color.fromARGB(255, 255, 226, 226);
}