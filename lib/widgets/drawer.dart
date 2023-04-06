import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageurl="https://www.centrik.in/wp-content/uploads/2017/02/user-image-.png";
    return Drawer(
      child: Container(
        color: Colors.blueGrey,
        child: ListView(
      
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child:UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                margin: EdgeInsets.zero,
                accountName: Text("Aditya Sudhanshu"),
                accountEmail: Text("adityasudhanshu2009@gmail.com"),
                currentAccountPicture: Image.network(imageurl),
              ) 
            ),
            Divider(height: 0.3,thickness: 0.7,color: Colors.white,),
            SizedBox(height: 10,),
            ListTile(
              leading: Icon(
               CupertinoIcons.home,color: Colors.white,
              ),
              title: Text("Home",textScaleFactor: 1.4,style: TextStyle(color: Colors.white,),),
            ),
            ListTile(
              leading: Icon(
               CupertinoIcons.mail,color: Colors.white,
              ),
              title: Text("Mail",textScaleFactor: 1.4,style: TextStyle(color: Colors.white,),),
            ),
            ListTile(
              leading: Icon(
               CupertinoIcons.profile_circled,color: Colors.white,
              ),
              title: Text("Profile",textScaleFactor: 1.4,style: TextStyle(color: Colors.white,),),
            ),
          ],
        ),
      ),
    );
  }
}