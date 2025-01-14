import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Custom%20Ui/Avtar_card.dart';
import 'package:whatsapp_clone/Custom%20Ui/button_card.dart';
import 'package:whatsapp_clone/Custom%20Ui/contact_card.dart';
import 'package:whatsapp_clone/Model/chat_model.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
    List<ChatModel> groups =[];
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          Text('New Group',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
          Text('Add participants',style: TextStyle(fontSize: 13))
        ],),
        actions: [
          IconButton(onPressed: (){}, 
          icon: Icon(Icons.search,size: 26,)),
        
        ],
      ),
      body: Stack(
        children:[
          ListView.builder(
          itemCount: contacts.length + 1,
          itemBuilder: (context, index){
           if(index == 0){
            return Container(
              height: groups.length>0? 90 : 10,
            );
           }
              return InkWell(
                onTap:(){
                 if(contacts[index - 1].select==false){
                  setState(() {
                    contacts[index - 1].select=true;
                    groups.add(contacts[index - 1]);
                  });
                 }
                 else{
                    setState(() {
                    contacts[index - 1].select=false;
                    groups.remove(contacts[index - 1]);
                  });
                 }
                },
                child:  ContactCardScreen(contact: contacts[index - 1])); 
            
          }),
         groups.length>0? Column(
            children:[
              Container(
              height: 75,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contacts.length,
                itemBuilder: (context,index) {
                  if(contacts[index].select==true){
                    return InkWell(
                      onTap: (){
                        setState(() {
                     groups.remove(contacts[index]);        
                     contacts[index].select=false;
                                    });
                      },
                      child: AvtarCard(contact: contacts[index],));
                  }else{
                    return Container();                  }
                },
                ),
            ),
            Divider(thickness: 1,)
            ] 
          ) : Container(),
        ] 
      )
      
    );
  }
}