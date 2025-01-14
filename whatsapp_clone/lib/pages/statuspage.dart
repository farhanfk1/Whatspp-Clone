import 'package:flutter/material.dart';

class StatusScreenPage extends StatefulWidget {
  const StatusScreenPage({super.key});

  @override
  State<StatusScreenPage> createState() => _StatusScreenPageState();
}

class _StatusScreenPageState extends State<StatusScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
                    ListView.builder(
            itemCount: 100,
            itemBuilder: (context,index){
              return  ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green,
                      width: 3,
                    )
                  ),
                  child:const CircleAvatar(
                    backgroundImage: NetworkImage('https://images.pexels.com/photos/3343253/pexels-photo-3343253.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                  ),
                ),
                title:const Text('Farhan khan'),
                subtitle:const Text('35 min ago'),
              );
            
          },),
    );
  }
}