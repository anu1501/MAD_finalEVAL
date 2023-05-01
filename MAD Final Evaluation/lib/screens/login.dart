// ignore_for_file: prefer_const_constructors, duplicate_ignore, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shopping_app/models/message.dart';
import 'package:shopping_app/models/seller.dart';
import 'package:shopping_app/screens/register.dart';
import 'package:shopping_app/services/seller_operations.dart';
import 'package:shopping_app/utils/constants.dart';
import 'package:shopping_app/utils/toast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}


class LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();

  late TextEditingController emailCtrl;
  late TextEditingController passwordCtrl;
  bool isLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      // appBar: AppBar(
        // title: Text('Login Form'),
        // backgroundColor: Colors.amberAccent, 
      // ),
      // drawer: const MenuDrawer(),
      // bottomNavigationBar:const BottomNavigation(),

      body: SafeArea(
        child:Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Image.network('https://img.freepik.com/free-vector/seasonal-sale-discounts-presents-purchase-visiting-boutiques-luxury-shopping-price-reduction-promotional-coupons-special-holiday-offers-vector-isolated-concept-metaphor-illustration_335657-2766.jpg?w=740&t=st=1682928617~exp=1682929217~hmac=6ef82a6055f6f7d3171ef825075b44d54de9454a00130fabdd2e6167a36580a5.jpg', height: 200,),

            SizedBox(height: 20,),

            // ignore: prefer_const_constructors
            Text("Welcome to YourShop",style: TextStyle(fontSize: 25,color: Colors.purple, fontWeight: FontWeight.bold, )),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5)),


            // Image.asset('images/Shop.jpeg'),
            Container(
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.cover, image: AssetImage(''images/Shop.jpeg'')
              //   ),
              // ),
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: Icon(Icons.password_sharp),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent, // Background color
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      ),
                      onPressed: (){
                        // Navigator.pushNamed(context, ConstantRoutes.ADD_PRODUCT_ROUTE);
                        _doLogin().then((value) async {
                              if (value == 1) {
                                await Future.delayed(Duration(seconds: 1));
                                Navigator.pushNamed(
                                    // context, ConstantRoutes.ADD_PRODUCT_ROUTE
                                    context, ConstantRoutes.CATALOG_ROUTE
                                    );
                              }
                            });
                      }, 
                      child: Text("Login",style: TextStyle(color: Colors.white, fontSize: 20,),)
                      )
                    ),
                ],
              ),
              
              Container(
                // alignment: Cc,
                // crossAxisAlignment:
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent, // Background color
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  ),
                  
                  onPressed: (){
                  // Navigator.push(
                  //         context, MaterialPageRoute(builder: (_) => Register()));
                  // Navigator.pushNamed(context, '/Register');
                  Navigator.pushNamed(context, ConstantRoutes.REGISTER_ROUTE);

                  }, 
                  child: Text("Register",style: TextStyle(color: Colors.white, fontSize: 20,),)
                )
              ),
            ],)


          ]
        ),
      )
    );
  }

  Future<int> _doLogin() async {
    String sellerId = emailCtrl.text;
    String password = passwordCtrl.text;
    Seller seller = Seller.takeInput(
        userId: sellerId, password: password, appId: Constants.APP_ID);
    SellerOperations opr = SellerOperations();
    Message msgObject = await opr.read(seller);
    createToast(msgObject.message, context);
    return msgObject.code;
  }

}
