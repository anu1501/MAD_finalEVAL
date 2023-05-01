// class Register extends StatefulWidget {
//   const Register({super.key});

//   @override
//   State<Register> createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   var formKey = GlobalKey<FormState>();
//   late TextEditingController emailCtrl;
//   late TextEditingController passwordCtrl;
//   late TextEditingController appIdCtrl;

//   void initState()
//   {
//     super.initState();
//     emailCtrl = TextEditingController();
//     passwordCtrl= TextEditingController();
//     appIdCtrl = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),

//       body: 
//       SafeArea(child:Form(
//               key: formKey,
//               // autovalidateMode: AutovalidateMode.always,
//               child: Column(
//                 children: [
                  
//                   TextFormField(
//                     initialValue: '',
//                     autovalidateMode: AutovalidateMode.always,
//                     validator: (String? value) {
//                       if (value!.isEmpty) {
//                         return "Enter your name";
//                       } else if (value.length < 8) {
//                         return "Enter more characters";
//                       } else {
//                         print(value);
//                         return null;
//                       }
//                     },
//                     decoration: const InputDecoration(labelText: "Name"),
//                   ),
//                   PasswordResetFormField(
//                     initialValue: Passwords(),
//                     onSaved: (Passwords? passwords) {
//                       print("Password: ${passwords?.password}");
//                     },
//                     autovalidateMode: AutovalidateMode.always,
//                     validator: (Passwords? passwords) {
//                       if (passwords!.nonEmpty()) {
//                         if (passwords.match()) {
//                           if (passwords.valid()) {
//                             RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
//                             if (!regex.hasMatch(passwords.password) && passwords.password.length<8 && passwords.password.length>32 ) {
//                               return 'Password should contain at least one letter (small case/upper case), letters, and special characters, and minimum length should be 8 characters, maximum length 32 characters';
//                             } else {
//                               //record.add(passwords.password);
//                               passwordCtrl = passwords.password as TextEditingController;
//                               return null;
//                             }
//                           }
//                           return "Password should be at least 8 characters long";
//                         }
//                         return "Does not match Password";
//                       }
//                       return "Password should not be empty";
//                     },
//                   ),
//                   TextFormField(
//                     initialValue: '',
//                     autovalidateMode: AutovalidateMode.always,
//                     validator: (String? value) {
//                       var regex =
//                           RegExp(r"^[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+$");
//                       if (!regex.hasMatch(value!)) {
//                         return "Provide a valid email format";
//                       }
//                       //record.add(value);
//                       emailCtrl = value as TextEditingController;
//                       return null;
//                     },
//                     decoration: const InputDecoration(labelText: "Email"),
//                   ),
//                   TextFormField(
//                     initialValue: '',
//                     autovalidateMode: AutovalidateMode.always,
//                     maxLength: 200,
//                     maxLines: 5,
//                     keyboardType: TextInputType.multiline,
//                     validator: (String? value) {
//                       if (value!.isEmpty) {
//                         return "Input your address";
//                       }
//                       print(value);
//                       return null;
//                     },
//                     decoration: const InputDecoration(labelText: "Address"),
//                   ),
//                 ],
//               )),),
//     );
//   }

//   dynamic _register() async{
//     String message = '';
//     String email = emailCtrl.text;
//     String password = passwordCtrl.text;
//     String appId = appIdCtrl.text;

//     if(appId!=Constants.APP_ID){
//       message = "Wrong App ID!";
//       return;
//     }
//     else{
//       Seller sellerobj = Seller.takeInput(email: email, password: password, appId: Constants.APP_ID);
//       SellerOperations opr = SellerOperations();
//       Message msgobj = await opr.add(sellerobj);
//       print(msgobj.message);
//       createToast(msgobj.message, context);
//     }
//   }
// }