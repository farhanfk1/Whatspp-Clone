import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Custom%20Ui/button_card.dart';
import 'package:whatsapp_clone/Custom%20Ui/contact_card.dart';
import 'package:whatsapp_clone/Model/chat_model.dart';
import 'package:whatsapp_clone/screens/create_group.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts =[
      ChatModel(name: "Saim",status: "A full stsck developer"),
      ChatModel(name: "Farhan khan",status: " stsck developer"),
      ChatModel(name: "Zuhair khan",status: "Front end developer"),
      ChatModel(name: "Nihal khan",status: "Back end developer"),
      ChatModel(name: "Sanan khan",status: "A full stsck developer"),
  ChatModel(name: "Saim",status: "A full stsck developer"),
      ChatModel(name: "Farhan khan",status: " stsck developer"),
      ChatModel(name: "Zuhair khan",status: "Front end developer"),
      ChatModel(name: "Nihal khan",status: "Back end developer"),
      ChatModel(name: "Sanan khan",status: "A full stsck developer"),
      
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          Text('Select contact',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
          Text('256 contact',style: TextStyle(fontSize: 13))
        ],),
        actions: [
          IconButton(onPressed: (){}, 
          icon: Icon(Icons.search,size: 26,)),
          PopupMenuButton<String>(
  color: Colors.white,
          onSelected: (value){
          print(value);
          },
          itemBuilder: ( BuildContext){
            return [
          PopupMenuItem(
            child: Text('Invite a friend'),value: "Invite a friend ",),
            
          PopupMenuItem(
            child: Text('Contacts'),value: "Contacts",),
            
          PopupMenuItem(
            child: Text('Refresh'),value: "Refresh",),
            
          PopupMenuItem(
            child: Text('Help'),value: "Help",),
         
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index){
          if(index==0){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateGroup()));
              },
              child: ButtonCardScreen(icon: Icons.group, name: "New Group",));
          }else if(index==1){
            return ButtonCardScreen(icon: Icons.person_add,name: "New Contact",);
          }
            return ContactCardScreen(contact: contacts[index - 2]); 
          
        })
      
    );
  }
}