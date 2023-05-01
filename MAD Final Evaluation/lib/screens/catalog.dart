// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:shopping_app/models/user.dart';
import 'package:shopping_app/screens/cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/constants.dart';

List<String> catalogOption=["Pants","Coca Cola","Shirt","Shorts","Sprite","Pen Set","Microscope","MnM Mega pack","Pasta Mix Sauce pack","Pumpkin Powder Coffee"];
List  colors=[Colors.grey,Colors.blue,Colors.grey,Colors.blue,Colors.grey,Colors.blue,Colors.grey,Colors.blue,Colors.grey,Colors.blue];

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  var formKey = GlobalKey<FormState>();

  User1 user= User1();
  @override
  @override
  List<Widget> listCatalogFunc()
  {
    List<Widget> data=[];
    for(int i=0;i<catalogOption.length;i++)
    {
      data.add(Row(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            // padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(10),
            decoration: new BoxDecoration(
              color: colors[i] ,
              borderRadius: BorderRadius.circular(200),
            )
          ),
          Expanded(child: Text(catalogOption[i],style: TextStyle(fontSize: 20))),

          Container(
            child: Container(
              child:
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[50],
      ),
                child: (user.Selected[i]==false)?Text("Add",style: TextStyle(color: Colors.purple)):Icon(Icons.check,color: Colors.purple,)
                , onPressed: (){
                 setState(() {
                  if(user.Selected[i]==true)user.Selected[i]=false;
                  else user.Selected[i]=true;
                });
              },)
            ),
          )
        ],
      ));
    }
    return data;
  }
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: Column(
          children: [

            const UserAccountsDrawerHeader(
              accountName: Text('Aryan Pruthi'),
              accountEmail: Text('GuestShooper69'),

              currentAccountPicture: CircleAvatar(

              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, ConstantRoutes.ADD_PRODUCT_ROUTE);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () async{
                FirebaseAuth.instance.signOut();
                await Future.delayed(Duration(seconds: 1));  
                Navigator.pushNamed(context, ConstantRoutes.LOGIN_ROUTE);
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Catalog', style: TextStyle(color: Colors.white, fontFamily: "Montserrat"),),
        backgroundColor: Colors.purple,
        centerTitle: true,
        iconTheme: IconThemeData( color: Colors.white,),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: (){
             Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart(user: user,catalogOption:catalogOption))
            );
          },
          )
        ],
      ),
      //bottomNavigationBar: const BottomNavigation(),


      body: Container(
        // margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
                key: formKey,
                // autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: listCatalogFunc(),
                )),
           
          ],
        ),
      ),
    );
  }
}