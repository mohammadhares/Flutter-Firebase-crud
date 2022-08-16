import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  var formKey = GlobalKey<FormState>();
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var new_password = TextEditingController();
  var confirm_password = TextEditingController();


  void initState() {
    setState((){
        setItems();
    });
  }

  setItems() async {
      final prefs = await SharedPreferences.getInstance();
         firstname.text = prefs.getString('username').toString();
         lastname.text  = prefs.getString('password').toString();
  }

  submit() async {
    
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(child: _buildForm()),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: firstname,
                  decoration: InputDecoration(
                    labelText: ' Username ',
                    labelStyle: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: lastname,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),

                SizedBox(height: 30.0,),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {
                    
                  },
                  padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.indigo,
                  child: Text(
                    ' Update  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
