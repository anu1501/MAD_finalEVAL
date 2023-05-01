import 'package:flutter/material.dart';

class Passwords{
  late String password;
  late String confirmPassword;
  late int length;

  Passwords() {
    password = "";
    confirmPassword = "";
    length = 8;
  }

  bool nonEmpty() {
    return password != null &&
        password.length > 0 &&
        confirmPassword != null &&
        confirmPassword.length > 0;
  }

  bool confirmMatch() {
    return password == confirmPassword;
  }

  bool validLength() {
    return password.length >= length;
  }
}