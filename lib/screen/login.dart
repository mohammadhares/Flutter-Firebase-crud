import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/element/custom_elements.dart';
import 'package:flutter_firebase_crud/screen/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();
  var username = TextEditingController();
  var password = TextEditingController();

  Future<bool> userExists(username , password) async {
        return await FirebaseFirestore.instance.collection('users')
              .where('username', isEqualTo: username)
              .where('password', isEqualTo: password)
              .get()
              .then((value) => value.size > 0 ? true : false);
  }

// Login to System
  login() async {
    bool result = await userExists(username.text.toString(), password.text.toString());
    // ignore: unrelated_type_equality_checks
    if(result == true){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
    }else{
      password.text = '';
      Fluttertoast.showToast(msg: "Incorrect Username or Password", toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                // Image.asset(
                //   "assets/images/logo.png",
                //   width: width * 0.1,
                // ),
                Text(
                  'Admin Panel',
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Health Rate App',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'System for Criminals',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                
                SizedBox(
                  height: 20,
                ),
                MyInput_icon(username, 'Email', Icons.person_outline_outlined,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Type your Email';
                      } else {
                        return null;
                      }
                }),
                SizedBox(
                  height: 15,
                ),
                Input_Password(password, 'Password', (value) {
                  if (value.isEmpty) {
                    return 'Please Type Your Password';
                  } else {
                    return null;
                  }
                }),
                SizedBox(
                  height: 15,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      login();
                    }
                  },
                  padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.indigo,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                // ignore: 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
