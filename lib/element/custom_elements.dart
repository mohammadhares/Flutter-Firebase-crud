import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Input Types
// ignore: non_constant_identifier_names
Widget MyInput(controller, String name , valid ) {
  return Container(
    margin: EdgeInsets.only(right: 20, left: 20),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      validator: valid,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        hintText: name,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.indigo,
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
        fillColor: Colors.white.withOpacity(0.7),
        hintText: name,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.indigo,
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
        fillColor: Colors.white.withOpacity(0.7),
        hintText: name,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.indigo,
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


// Icons Widgets
class IconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  
  const IconWidget({
  required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(icon , color: Colors.white,),
    );
  }
}


// ignore: non_constant_identifier_names
Expanded LikeComment(int value, IconData icon, Color color, Function onTap) {
  return Expanded(
    child: Material(
      child: InkWell(
        onTap: () => onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: color,
              ),
              SizedBox(
                width: 4.0,
              ),
              Text('$value'),
            ],
          ),
        ),
      ),
    ),
  );
}

TextButton kTextButton(String label, Function onPressed){
  return TextButton(
    child: Text(label, style: TextStyle(color: Colors.white),),
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
      padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: 10))
    ),
    onPressed: () => onPressed(),
  );
}
