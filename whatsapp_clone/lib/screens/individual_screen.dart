
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Model/chat_model.dart';
class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chatModel});
 final ChatModel  chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show =false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller =TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener((){
      if(focusNode.hasFocus){
        setState(() {
          show=false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
   appBar: AppBar(
    backgroundColor: Colors.teal,
    leadingWidth: 70,
    titleSpacing: 0,
    leading: InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back,color: Colors.white,),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
           child:widget.chatModel.isFroup? Icon(Icons.person_3 ,color: Colors.white,): Icon(Icons.person,color: Colors.white,)
          )
        ],
      ),
    ),
    title: InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatModel.name,style: TextStyle(fontSize: 18.5,fontWeight: FontWeight.bold,color: Colors.white,),),
            Text('last seen todat at 12:05',style: TextStyle(fontSize: 13,color: Colors.white, ),)
          ],
        ),
      ),
    ),
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.videocam,color: Colors.white,)),
      IconButton(onPressed: (){}, icon: Icon(Icons.call,color: Colors.white,)),
 PopupMenuButton<String>(
  color: Colors.white,
          onSelected: (value){
          print(value);
          },
          itemBuilder: ( BuildContext){
            return [
          PopupMenuItem(
            child: Text('View Contact'),value: "View Contact",),
            
          PopupMenuItem(
            child: Text('Media, links and docs'),value: "Media links and docs",),
            
          PopupMenuItem(
            child: Text('Whatspp Web'),value: "Whatspp Web",),
            
          PopupMenuItem(
            child: Text('Search'),value: "Search",),
          PopupMenuItem(
            child: Text('Wallpaper'),value: "Wallpaper",),
              PopupMenuItem(
            child: const Text('Mute notification'),
            value: "Mute notification",
                     ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          
          child: Stack(
            children: [
              ListView( ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child:
                       Card(
                        margin: EdgeInsets.only(right: 2,left: 2,bottom: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: TextFormField(
                          controller: _controller,
                          focusNode: focusNode,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 6,
                          minLines: 1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type a message",
                            contentPadding: EdgeInsets.all(05),
                            prefixIcon: IconButton(onPressed: (){
                              focusNode.unfocus();
                              focusNode.canRequestFocus =false;
                              setState(() {
                                show = !show;
                              });
                            },
                             icon: Icon(Icons.emoji_emotions,color: Colors.teal)),
                           suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            IconButton(onPressed: (){
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder:(builder)=> bottomSheet()
                              );
                            },
                             icon: Icon(Icons.attach_file,color: Colors.teal)),
                            IconButton(onPressed: (){},
                             icon: Icon(Icons.camera_alt,color: Colors.teal,)),
                           ],)
                          ),
                        
          
                        ))),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8,right: 5,left: 2),
                        child: CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 25,
                          child: IconButton(onPressed: (){}, 
                          icon: Icon(Icons.mic,color: Colors.white,)),
                        ),
                      )
                    ],),
                  show?  emojiSelect() : Container(),
                  ],
                ),
              )
          
            ],
          ),
          onWillPop: (){
            if(show){
              setState(() {
                show =false;
              });
            }
            else{
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),

      ),
    );
  }
  Widget bottomSheet(){
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.height,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
              iconCreation(Icons.insert_drive_file, Colors.indigo,"Document"),
              SizedBox(width: 40,),
              iconCreation(Icons.camera_alt, Colors.pink,"Camera"),
                SizedBox(width: 40,),
              iconCreation(Icons.insert_photo, Colors.purple,"Gallery"),
          
              ],),
              SizedBox(height: 30,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
              iconCreation(Icons.headset, Colors.orange,"Audio"),
              SizedBox(width: 40,),
              iconCreation(Icons.location_pin, Colors.teal,"Location"),
                SizedBox(width: 40,),
              iconCreation(Icons.person, Colors.blue,"Contact"),
          
              ],)
            ],
          ),
        ),
      ),
    );
  }
  Widget iconCreation(IconData icon, Color color,String text){
    return InkWell(
      onTap: (){},
      child: Column(children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color,
              child: Icon(icon,size: 29,color: Colors.white,),
            ),
            SizedBox(height: 5,),
            Text(text,style: TextStyle(fontSize: 12),)
      ],),
    );
  }
 Widget emojiSelect() {
  return SizedBox(
  
    height: 250,
    child: EmojiPicker(
      
      onEmojiSelected: (emoji, category) {
        print(emoji); 
        print(emoji.runtimeType);
        setState(() {
           _controller.text += emoji.toString();
        });
      },
      config:const Config(
    
      ),
    ),
  );
}
}