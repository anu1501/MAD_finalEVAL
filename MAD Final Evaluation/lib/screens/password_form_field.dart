import 'package:shopping_app/models/password.dart';
import 'package:flutter/material.dart';

class PasswordResetFormField extends FormField<Passwords>{
  PasswordResetFormField({
    FormFieldSetter<Passwords>? onSaved,
    FormFieldValidator<Passwords>? validator,
    Passwords? initialValue,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
  }) : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<Passwords> state) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                        onChanged: (String value) {
                          state.value?.password = value;
                          state.didChange(state.value);
                        },
                      ),
                    ),
                    Container(
                    margin: EdgeInsets.all(10),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                        onChanged: (String value) {
                          state.value?.confirmPassword = value;
                          state.didChange(state.value);
                        },
                      ),
                    ),
                    
                    // state.hasError
                    //     ? Text(
                    //         state.errorText.toString(),
                    //         style: TextStyle(color: Colors.red),
                    //       )
                    //     : Container(),

                    state.hasError ? Text(state.errorText.toString(), style: TextStyle(color: Colors.red),) : Container()
                    
                  ],
                ),
              );
            });
}