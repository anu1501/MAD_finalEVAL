import 'package:flutter/material.dart';
import 'package:shopping_app/models/message.dart';
import 'package:shopping_app/models/password.dart';
import 'package:shopping_app/models/seller.dart';
import 'package:shopping_app/screens/login.dart';
import 'package:shopping_app/screens/password_form_field.dart';
import 'package:shopping_app/services/seller_operations.dart';
import 'package:shopping_app/utils/constants.dart';
import 'package:shopping_app/utils/toast.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => RegisterState();
}


class RegisterState extends State<Register> {
  
  late TextEditingController emailIdCtrl;
  late TextEditingController passwordCtrl;
  late TextEditingController appIdCtrl;

  void initState(){

    super.initState();
    emailIdCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    appIdCtrl = TextEditingController();

  }

  var formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(
        title: Text('Register Form'),
        // backgroundColor: Colors.amberAccent, 
      ),
      // drawer: const MenuDrawer(),
      // bottomNavigationBar:const BottomNavigation(),

      body: SafeArea(

        child:Form(
          key: formKey,

          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children:[

              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  initialValue: '',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Enter your name";
                    } else if (value.length < 8) {
                      return "Enter more characters";
                    } else {
                      print(value);
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "User Name",
                    // labelText: "Enter Name",
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
                    labelText: "Enter Password",
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),

              // PasswordResetFormField(
              //   initialValue: Passwords(),
              //   onSaved: (Passwords? passwords) {
              //     print("Password: ${passwords?.password}");
              //   },
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   validator: (Passwords? passwords) {
              //     if (passwords!.nonEmpty()) {
              //       if (passwords.confirmMatch()) {
              //         if (passwords.validLength()) {
              //           RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
              //           if (!regex.hasMatch(passwords.password) && passwords.password.length<8 && passwords.password.length>32 ) {
              //             return 'Password should contain at least one letter (small case/upper case), letters, and special characters, and minimum length should be 8 characters, maximum length 32 characters';
              //           } else {
              //             //record.add(passwords.password);
              //             passwordCtrl = passwords.password as TextEditingController;
              //             return null;
              //           }
              //         }
              //         return "Password should be at least 8 characters long";
              //       }
              //       return "Does not match Password";
              //     }
              //     return "Password should not be empty";
              //   },
              // ),

              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                      initialValue: '',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLength: 200,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Input your address";
                        }
                        print(value);
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter Address",
                        prefixIcon: Icon(Icons.location_city),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
              ),

              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: emailIdCtrl,
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    prefixIcon: Icon(Icons.login),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: appIdCtrl,
                  decoration: InputDecoration(
                    labelText: "Enter Registeration Code",
                    prefixIcon: Icon(Icons.app_registration),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),

              Row(children: [

                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(onPressed: (){
                      _register();
                      Navigator.pushNamed(context, ConstantRoutes.LOGIN_ROUTE);
                    }, 
                    child: Text("Register")
                  )
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                      // Navigator.push(
                      //         context, MaterialPageRoute(builder: (_) => Login()));
                      // Navigator.pushNamed(context, '/Login');
                      // Navigator.pushNamed(context, ConstantRoutes.LOGIN_ROUTE);    
                    }, 
                    child: Text("Cancel")
                  )
                ),
              ],)


            ]
          ),
        ),
      )
    );
  }

  _register() async{
    String message ="";
    String sellerId =emailIdCtrl.text;
    String password =passwordCtrl.text;
    String appId =appIdCtrl.text;

    //check if app id correct
    if(appId!=Constants.APP_ID){
      print('check1');
      Message msg = Message.takeMessage(message: "Incorrect App Id", code: Constants.Fail);
      print(msg.message);
      createToast(msg.message, context);
      return; 
      // Message.takeMessage(message: "Incorrect App Id", code: Constants.Fail); 
    }
    else{
      Seller sellerObj = Seller.takeInput(userId: sellerId, password: password, appId: appId);
      // print('check2');
      SellerOperations opr = SellerOperations();
      // print('check3');
      Message msgObj = await opr.add(sellerObj);
      print(msgObj.message);
      // print('check4');
      createToast(msgObj.message, context); // prompts that come for seconds and go gayab are called toaster
    }
    
  }

}
