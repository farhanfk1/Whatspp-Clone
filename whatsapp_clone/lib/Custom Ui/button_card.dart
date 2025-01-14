import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Model/chat_model.dart';

class ButtonCardScreen extends StatelessWidget {
 const  ButtonCardScreen({super.key,required this.name, required this.icon});
 final String name;
 final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        backgroundColor: Colors.teal,
        child: Icon(icon,color: Colors.white, size: 26,),
      ),
      title: Text(name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
    );
  }
}