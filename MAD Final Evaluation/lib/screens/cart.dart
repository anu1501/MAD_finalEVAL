// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopping_app/screens/catalog.dart';
import 'package:shopping_app/models/user.dart';
import 'package:shopping_app/screens/checkout.dart';

class Cart extends StatelessWidget {
  User1 user;
  List<String> catalogOption;

  Cart({super.key, required  this.user, required this.catalogOption});
  
  double price=0.0;
  List<String> selected_colors=[];
  
  @override
  Widget build(BuildContext context) {
  for(int i=0;i<user.Selected.length;i++)
  {
    if(user.Selected[i]==true){
      price +=  user.price[i]!.toDouble();
      selected_colors.add(catalogOption[i]);
    }   
  }
    return Scaffold(
      backgroundColor: Colors.purpleAccent,

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, 
        ),
        title: Text('Cart',style: TextStyle(fontSize: 25 ,color: Colors.black,fontFamily: 'Montserrat',fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white, 
        centerTitle: true,
      ),

      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(30),
        child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for(int i = 0; i < selected_colors.length; i++) ...[
                  Text(" - ${selected_colors[i]}", style: TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.bold),) 
                ],
            ],
            
          ),
        decoration: BoxDecoration(border: Border(bottom:BorderSide(width: 5))),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.purpleAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container( 
            //   padding:EdgeInsets.fromLTRB(0, 50, 25, 50), child: Text("",  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),)
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
                ),
                onPressed: (){
                  Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Checkout(user: user))
                );

                }, child: Text("Buy Now",), 
              // style: ButtonStyle(backgroundColor: )
              ),
            )

          ],
        ),),
    );
  }
}