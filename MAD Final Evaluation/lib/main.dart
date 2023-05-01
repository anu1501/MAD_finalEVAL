import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/login.dart';
import 'package:shopping_app/config/routes.dart';
import 'package:shopping_app/utils/constants.dart';



void main() async{
  // ensure widget gets loaded first 
  WidgetsFlutterBinding.ensureInitialized();
  //initialize firebase => returns a future object =>
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
    );

  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),

      // home: Login(),
      routes: getRoutes(),
      initialRoute: ConstantRoutes.HOME_ROUTE,

      // routes: {
      //   '/':(context) => Login(),
      //   '/Login':(context) => Login(),
      //   // '/Home':(context) => HomeScreen(),
      //   // '/Color':(context) => ColorCatalog(),
      // },
      // initialRoute: '/',

  );


  }
}