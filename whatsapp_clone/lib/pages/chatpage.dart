import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Custom%20Ui/custom_card.dart';
import 'package:whatsapp_clone/Model/chat_model.dart';
import 'package:whatsapp_clone/screens/select_contact.dart';

class ChatPageScreen extends StatefulWidget {
  const ChatPageScreen({super.key});

  @override
  State<ChatPageScreen> createState() => _ChatPageScreenState();
}

class _ChatPageScreenState extends State<ChatPageScreen> {
  List<ChatModel> cahts = [
    ChatModel(time: "04:00",
     name: "Nihal khan",
      icon: Icons.person,
       isFroup: false,
        currentMessage: "Hi every one"),
            ChatModel(time: "05:00",
     name: "Zuhair Ali",
      icon: Icons.add,
       isFroup: true,
        currentMessage: "how are you"),
            ChatModel(time: "05:00",
     name: "Zuhair Ali",
      icon: Icons.person_3,
       isFroup: true,
        currentMessage: "how are you"),  
          ChatModel(time: "05:00",
     name: "Zuhair Ali",
      icon: Icons.person_3,
       isFroup: false,
        currentMessage: "how are you"),
            ChatModel(time: "05:00",
     name: "Zuhair Ali",
      icon: Icons.person_3,
       isFroup: false,
        currentMessage: "how are you"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
        SelectContact()));
      },
      child:const Icon(Icons.chat),
      ),
      body:  
         ListView.builder(
          itemCount: cahts.length,
          itemBuilder: (context, index)=>CustomCard(chatModel: cahts[index],))
    );
  }
}