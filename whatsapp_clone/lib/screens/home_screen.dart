import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/callpage.dart';
import 'package:whatsapp_clone/pages/chatpage.dart';
import 'package:whatsapp_clone/pages/statuspage.dart';

class home_Screen extends StatefulWidget {
  const home_Screen({super.key});

  @override
  State<home_Screen> createState() => _home_ScreenState();
}

class _home_ScreenState extends State<home_Screen> with SingleTickerProviderStateMixin{
 late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: false,
      title:const Text('whatsapp',style: TextStyle(color: Colors.white),),
      bottom: TabBar(
        controller: _controller,
        indicatorColor: Colors.white,
        tabs:const [
          
        Tab(child:    Icon(Icons.camera_alt,color: Colors.white),
        ),
        Tab(child:    Text('chats',style: TextStyle(color: Colors.white),),),
        Tab(child:    Text('status',style: TextStyle(color: Colors.white),),),
        Tab(child:    Text('calls',style: TextStyle(color: Colors.white),),)
    
      ]
      ),
      actions: [
       const Icon(Icons.search,color: Colors.white,),
      const  SizedBox(width: 10,),
        PopupMenuButton<String>(
          onSelected: (value){
          print(value);
          },
          itemBuilder: ( BuildContext){
            return [
          PopupMenuItem(
            child: Text('New Group'),value: "New Group",),
            
          PopupMenuItem(
            child: Text('New broadcas'),value: "New broadcst",),
            
          PopupMenuItem(
            child: Text('Whatspp Web'),value: "Whatspp Web",),
            
          PopupMenuItem(
            child: Text('Stared Message'),value: "Stared Message",),
          PopupMenuItem(
            child: Text('Settings')),
              PopupMenuItem(
            child: const Text('Log out'))
    
        ];
          }),
        
      const  SizedBox(width: 10,),
    
      ],
      ),
      body:  TabBarView(
        controller: _controller,
        children:const [
    
        // camera screen
    
         const Text('camerq'),
    
         // chats screen
    
       ChatPageScreen(),
    
    
         // status screen 
    StatusScreenPage(),
    
    
        // calls screen
    
        CallsPageScreen(),
    
        ],
      ),
      
    );
  }
}