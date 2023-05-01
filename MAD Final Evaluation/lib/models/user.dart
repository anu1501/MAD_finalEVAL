import 'package:flutter/material.dart';

class User1{
  late String? RegId;
  late String? Name;
  late String? Password;
  late String? ConfirmPassword;
  late String? CheckPassword;
  late String? Email;
  late String? Address;

  User1({this.RegId, this.Name, this.Password, this.ConfirmPassword, this.Email, this.Address});
  
  List<bool?> Selected=[false,false,false,false,false,false,false,false,false,false];
  List<double?> price=[19,43,56,34,54,32,54,67,78,89];

  

  // TransferData() {
  //   RegId= "";
  //   Name = "";
  //   Password = "";
  //   ConfirmPassword = "";
  //   Email = "";
  //   Address = "";
  // }

  // bool nonEmpty() {
  //   return password != null &&
  //       password.length > 0 &&
  //       confirmPassword != null &&
  //       confirmPassword.length > 0;
  // }

  // bool confirmMatch() {
  //   return password == confirmPassword;
  // }

  // bool validLength() {
  //   return password.length >= length;
  // }
}