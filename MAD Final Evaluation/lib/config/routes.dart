import 'package:flutter/material.dart';
import 'package:shopping_app/screens/cart.dart';
import 'package:shopping_app/screens/catalog.dart';
import 'package:shopping_app/screens/add_product.dart';
import 'package:shopping_app/screens/login.dart';
import 'package:shopping_app/screens/register.dart';
import 'package:shopping_app/utils/constants.dart';

Map<String,WidgetBuilder> getRoutes(){
  return{
    '/':(context) => const AddProduct(),
    ConstantRoutes.LOGIN_ROUTE:(context) => const Login(),
    ConstantRoutes.REGISTER_ROUTE:(context) => const Register(),
    ConstantRoutes.ADD_PRODUCT_ROUTE:(context) => const AddProduct(),
    ConstantRoutes.CATALOG_ROUTE:(context) => const Catalog(),
    // ConstantRoutes.ADD_PRODUCT_ROUTE:(context) => Cart(),

    // initialRoute: '/',
  };
}