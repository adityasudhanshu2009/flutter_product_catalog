import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton=false;
  final _formKey=GlobalKey<FormState>();

  movetoHome(BuildContext context) async{
    if(_formKey.currentState!.validate()){
     setState(() {
                      changeButton=true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    await Navigator.pushNamed(context, MyRoutes.homeRoute);
                    setState(() {
                      changeButton=false;
                    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 150.0),
              Padding(
                padding:EdgeInsets.only(left:20,right: 20),
                child: Image.asset("assets/images/login1.png",fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30.0),
              Text("Welcome $name",style:TextStyle(
                fontSize:30,
                fontWeight:FontWeight.bold,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:25,horizontal:30),
                child: Column(
                  children: [
                    TextFormField(
                  decoration:InputDecoration(
                    hintText:"Enter the username",
                    labelText:"Username",
                    
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Username cannot be empty";
                    }
                    return null;
                  },
                  onChanged:(value){
                    name=value;
                    setState(() {
                      
                    });
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  obscureText: true,
                  decoration:InputDecoration(
                    hintText:"Enter the password",
                    labelText:"Password",
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Password cannot be empty";
                    }
                    else if(value.length<6){
                      return "Password length too small";
                    }
                      return null;
                  },
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap:()=>movetoHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds:1),
                    width:changeButton?50:130,
                    height:50,
                    alignment: Alignment.center,
                    child: changeButton?
                    Icon(Icons.done,color: Colors.white,):
                    Text("Login",
                    style:TextStyle(
                      fontSize: changeButton?12:20,
                      color:Colors.white
                    ) ,),
                    decoration: BoxDecoration(
                       color: Colors.blueGrey,
                       //shape: changeButton?BoxShape.circle:BoxShape.rectangle,
                       borderRadius:BorderRadius.circular(changeButton?50:10),
                    ),
                  ),
                )
                  ],
                ),
              )
              
              
            ],
          ),
        ),
      ),

      );
  }
}
