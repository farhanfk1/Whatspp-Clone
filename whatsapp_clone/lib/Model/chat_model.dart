
import 'package:flutter/material.dart';

class ChatModel{
  String name;
  IconData icon;
  bool isFroup;
  String time;
  String currentMessage;
  String status;
  bool select =false;
  ChatModel({
     this.time='', this.name='', this.icon=Icons.abc , this.isFroup=false,this.currentMessage='', this.status = '',this.select = false,
  });
}