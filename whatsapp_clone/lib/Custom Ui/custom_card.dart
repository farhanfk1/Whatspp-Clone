import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Model/chat_model.dart';
import 'package:whatsapp_clone/screens/individual_screen.dart';

class CustomCard extends StatelessWidget {
const CustomCard({super.key,required this.chatModel});
 final ChatModel  chatModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualPage(chatModel: chatModel,)));
      },
      child: Column(
        children: [ ListTile(
          leading: CircleAvatar(
            radius: 30,
            
                    child:
                     chatModel.isFroup? Icon(Icons.person_3 ,color: Colors.white,): Icon(Icons.person,color: Colors.white,)
                    
                    
                    ),
          trailing: Text(chatModel.time),
          title: Text(
            chatModel.name,
             style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          subtitle: Row(
            children: [
              Icon(Icons.done_all),
              SizedBox(width: 03,),
              Text(chatModel.currentMessage,style: TextStyle(fontSize: 14),)
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(right: 20, left: 80),
          child: Divider(thickness: 1.5,),
        )
        ]
      ),
    );
  }
}