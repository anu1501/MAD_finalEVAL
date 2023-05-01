import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/menu_drawer.dart';
import 'package:shopping_app/utils/constants.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => AddProductState();
}

class AddProductState extends State<AddProduct> {
  var _formKey = GlobalKey<FormState>();
  // CategoryOptions gender = CategoryOptions.Pantry;

  @override
  @override
  Widget build(BuildContext context) {

    var student = {};
    var Transfer = [];


    String dropdownvalue = 'Courses';
    List<String> dropdownitems= [
      'Courses','FullStack','Cloud Computing','Artificial Intelligence'];
    
    return Scaffold(
      resizeToAvoidBottomInset : false,

      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,

      ),

      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: Text('useremail@example.com'),
              currentAccountPicture: CircleAvatar(
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Product'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search Product'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () async{
                FirebaseAuth.instance.signOut();
                await Future.delayed(Duration(seconds: 1));
                Navigator.pushNamed(context, ConstantRoutes.LOGIN_ROUTE);
              },
            ),
          ],
        ),
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 5, 20),

            child: ListView(
              children: [
                
                Form(
                  key: _formKey,
                  // autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [

                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            print("<<Validating Item Id field>>");
                            if (value!.isEmpty) {
                              return "Provide Item Id";
                            }
                            return null; // successful validation
                          },

                          decoration: InputDecoration(labelText: "Item Id",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          onSaved: (String? value) {
                                // _id = value;
                              },
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            print("<<Validating Item Name field>>");
                            if (value!.isEmpty) {
                              return "Provide Item name";
                            }
                            return null; // successful validation
                          },

                          decoration: InputDecoration(labelText: "Item Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          // decoration: const InputDecoration(labelText: "Item Name"),
                          onSaved: (String? value) {
                                // user.Name = value.toString();
                              },
                        ),
                      ),

                      
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            print("<<Validating Item Price field>>");
                            if (value!.isEmpty) {
                              return "Provide Item Price";
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter valid price';
                            }
                            return null; // successful validation
                          },

                          decoration: InputDecoration(labelText: 'Price',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (String? value) {
                            // _price = double.parse(value);
                          },
                        ),
                      ),
                      
                      // Image.network(""),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            print("<<Validating Image Url field>>");
                            if (value!.isEmpty) {
                              return "Provide Image Url";
                            }
                            return null; // successful validation
                          },

                          decoration: InputDecoration(labelText: 'Photo URL',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          onSaved: (String? value) {
                            // _photoUrl = value;
                          },
                        ),
                      ),

                      
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            print("<<Validating Description field>>");
                            if (value!.isEmpty) {
                              return "Provide Description";
                            }
                            return null; // successful validation
                          },

                          // decoration: const InputDecoration(labelText: "Description"),
                          decoration: InputDecoration(labelText: 'Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          onSaved: (String? value) {
                            // _description = value;  
                          },
                        ),
                      ),

                      
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            print("<<Validating Quantity field>>");
                            if (value!.isEmpty) {
                              return "Provide Quantity";
                            }
                            if (int.tryParse(value) == null) {
                              return 'Provide valid Quantity';
                            }
                            return null; // successful validation
                          },
                          
                          decoration: InputDecoration(
                            labelText: 'Quantity', 
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (String? value) {
                            // _quantity = int.parse(value);
                          },
                        ),
                      ),

                    ],
                  )
                ),

//------------------------------------Submit Button-------------------------------------------
                Container(
                  // margin: EdgeInsets.fromLTRB(0, 20 , 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          // (){
                          //   // Navigator.pushNamed(context, ConstantRoutes.ADD_PRODUCT_ROUTE);
                          // }, 
                          child: Text("Add")
                        )
                      ),
                      
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: _resetForm,
                          // (){
                          //   // Navigator.push(
                          //   //         context, MaterialPageRoute(builder: (_) => Register()));
                          //   // Navigator.pushNamed(context, '/Register');
                          //   Navigator.pushNamed(context, ConstantRoutes.ADD_PRODUCT_ROUTE);
                          // }, 
                          child: Text("Reset")
                        )
                      ),
                    ],
                  )
                )
              ],
            ),
          ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Add product to database
      // Navigator.pushNamed(context, RoutesConstants.LOGIN);
    }
  }
  void _resetForm() {
    _formKey.currentState!.reset();
    // Navigator.pop(context);
  }


}
