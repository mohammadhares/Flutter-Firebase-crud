import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/element/constant.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// Input Types
// ignore: non_constant_identifier_names
Widget Input_Password(controller, String name, validator ) {
  return Container(
    margin: EdgeInsets.only(right: 20, left: 20),
    child: TextFormField(
      obscureText: true,
      controller: controller,
      keyboardType: TextInputType.text,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Icon(Icons.lock_outline_rounded),
        ),
        contentPadding: EdgeInsets.all(20),
        filled: true,
        fillColor: Color.fromARGB(255, 232, 226, 226).withOpacity(0.7),
        hintText: name,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget MyInput_icon(controller, String name, icon, valids ) {
  return Container(
    margin: EdgeInsets.only(right: 20, left: 20),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: valids,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Icon(icon),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 232, 226, 226).withOpacity(0.7),
        hintText: name,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    ),
  );
}

