import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Model/chat_model.dart';

class AvtarCard extends StatelessWidget {
  const AvtarCard({super.key,required this.contact});
 final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Stack(
            children:[
              CircleAvatar(
              radius: 23,
              backgroundColor: Colors.blueGrey[200],
              child: Icon(Icons.person,color: Colors.white,),
            ),
             Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 11,
                child: Icon(Icons.clear,color: Colors.white,size: 13,)),
            ) 
            ] 
          ),
          SizedBox(height: 2,),
          Text(contact.name,style: TextStyle(fontSize: 12),)
        ],
      ),
    );
  }
}