import 'package:flutter/material.dart';

class CallsPageScreen extends StatefulWidget {
  const CallsPageScreen({super.key});

  @override
  State<CallsPageScreen> createState() => _CallsPageScreenState();
}

class _CallsPageScreenState extends State<CallsPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   ListView.builder(
            itemCount: 100,
            itemBuilder: (context,index){
              return  ListTile(
                leading:const CircleAvatar(
                  backgroundImage: NetworkImage('https://images.pexels.com/photos/3343253/pexels-photo-3343253.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                ),
                title:const Text('Farhan khan'),
                subtitle:const Row(children: [
                  Icon(Icons.arrow_downward),
                  Text('Today, 4:45 pm')
                ],),
                trailing: Icon(index /2 == 0 ?  Icons.phone : Icons.video_call),
              );
            
          },),
    );
  }
}