
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/models/message.dart';
import 'package:shopping_app/models/seller.dart';
import 'package:shopping_app/utils/constants.dart';

class SellerOperations{
  
  //addd new user
  // add(){}

  // authenticate user
  // read(){}

  // update existing user
  // update(){}

  // deactivate user account
  // remove(){}

  //Step1:
  final FirebaseAuth _auth =FirebaseAuth.instance;

  // register

  // Future add(Seller seller) async {
  Future<Message> add(Seller seller) async {
    // if register succesfull
    // print('check5');
    try{
      await _auth.createUserWithEmailAndPassword(email: seller.userId, password: seller.password); //
      Message msg = Message.takeMessage(message: "Sucessfull register", code: Constants.SUCCESS); 
      // print('check6');
      return msg;
    }
    //if register fail
    catch(err){
      // print('check7');
      print(err);
      return Message.takeMessage(message: "Falied Registeration", code: Constants.Fail);

    }

  }

  Future<Message> read(Seller seller) async {
    // if register succesfull
    try{
      // awai
      await _auth.signInWithEmailAndPassword(email: seller.userId, password: seller.password); //
      Message msg = Message.takeMessage(message: "Sucessfull Login", code: Constants.SUCCESS); 
      return msg;
    }
    //if register fail
    catch(err){
      print(err);
      return Message.takeMessage(message: "Falied Login", code: Constants.Fail);

    }

  }

  update(){}

  remove(){}

}