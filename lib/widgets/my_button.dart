import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.color,required this.title,required this.onPressed});
  final Color color;
  final String title;
  final Function onPressed;
  Widget build(BuildContext context){
    return Padding(
        padding:const EdgeInsets.symmetric(vertical: 10),
    child:Material(
    elevation: 5,
    color: color,
    borderRadius: BorderRadius.circular(10),
    child: MaterialButton(
    onPressed: ()=>onPressed,
    minWidth: 200,
    height: 42,
    child: Text(
    title,
    style: TextStyle(color: Colors.white),
    ),
    ),
    ),
    );
  }
} /* const SizedBox(height: 50,)
,TextFormField(
decoration: InputDecoration(
border: InputBorder.none,
hintText: 'Enter Full Name',
prefixIcon: Icon(Icons.person,
color: Colors.black38.withOpacity(0.5)
,)
),
cursorColor: Colors.black38,
),*/

//////////////////////////