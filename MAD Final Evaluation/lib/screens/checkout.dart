import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_app/models/user.dart';

class Checkout extends StatelessWidget {
  User1 user;
  Checkout({super.key,  required  this.user});
  double price=0.0;

  @override
  Widget build(BuildContext context) {
    for(int i=0;i<user.Selected.length;i++)
      {
        if(user.Selected[i]==true){
          price +=  user.price[i]!.toDouble();
          // selected_colors.add(catalogOption[i]);
        }   
      }

    return Scaffold(
      backgroundColor: Colors.amberAccent,

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, 
        ),
        title: Text('Checkout',style: TextStyle(fontSize: 25 ,color: Colors.black,fontFamily: 'Montserrat',fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white, 
        centerTitle: true,
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.amberAccent,
        child: Row(
          children: [
            Container( 
              padding:EdgeInsets.fromLTRB(75, 50, 10, 50), 
              child: Text("Pay Amount: Rs",  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),)
            ),
            Container( 
              padding:EdgeInsets.fromLTRB(10, 50, 25, 50), child: Text("${price}",  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),)
            ),
            // ElevatedButton(onPressed: (){
            //   Navigator.push(
            //   context, MaterialPageRoute(builder: (context) => Checkout(user: user))
            // );

            // }, child: Text("Buy Now",), 
            // style: ButtonStyle(backgroundColor: )
            // )

          ],
        ),)


    );
// padding:EdgeInsets.fromLTRB(65, 50, 25, 50), child: Text("\$${price}",  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),)
  }
}