// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopping_app/screens/add_product.dart';
import 'package:shopping_app/screens/login.dart';
import 'package:shopping_app/screens/register.dart';
// import 'package:kitchenease/custom/StoreSample.dart';
// import 'package:kitchenease/auth/sign_in.dart';
// import 'package:kitchenease/screens/home_screen.dart';
// import 'package:kitchenease/screens/inventory_page.dart';
// import 'package:kitchenease/screens/recipe_page.dart';

// import 'package:kitchenease/auth/register.dart';
// import 'package:kitchenease/auth/sign_in.dart';
// import 'package:kitchenease/screens/shopping_cart_page.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext ctx){
    final List<String> menuTitles=['Home', 'Login', 'Register', 'AddProduct'];

    List<Widget> menuItems = []; //cause only widgets get clickable property

    menuItems.add(
      DrawerHeader(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        child: Center(
          child: Column(
            children: [
              Text('O', 
                style: TextStyle(
                  // decoration: BoxDecoration,
                  color: Colors.white, 
                  fontSize:70
                ),
              ),
              Text('Menu Options:', 
                style: TextStyle(
                  color: Colors.white, 
                  // fontSize:30
                ),
              ),
            ],
          ),
        ),
      )
    );

    menuTitles.forEach((element) {
      Widget screen = Container();// variable hold empty container

      menuItems.add(ListTile(
        title: Text(element, style: const TextStyle(fontSize: 25),),
        onTap: () {
          
          switch(element){ 
            case 'Home':
              screen = Login();
              break;
            case 'Login':
              screen = Login();
              break;
            case 'Register':
              screen = Register();
              break;
            case 'AddProduct':
              screen = AddProduct();
              break;
            // case 'ShoppingCart':
            //   screen = ShoppingCartPage(InventoryOption: [], user: null,);
            //   break;
            // case 'Recipe':
            //   screen = RecipePage();
            //   break;
            // case 'SampleTest':
            //   screen = ListTileSelectExample();
            //   break;
          }

          Navigator.of(ctx).push(
            MaterialPageRoute(builder: (ctx) => screen),
          );

        },
    ));  
    });

    return menuItems;    

  }

}