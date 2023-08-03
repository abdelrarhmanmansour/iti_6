import 'package:chat_message/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore= FirebaseFirestore.instance;
 late User signinuser;

class chatscreen extends StatefulWidget {
   static const String routescreen=' chatscreen';
  const chatscreen({super.key});

  @override
  State<chatscreen> createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {
    final messagetextcontroller=TextEditingController();
    final _auth= FirebaseAuth.instance;
   
    String?messageText;
   
   @override
  void initState() {
    super.initState();
    getcurrentuser();
  }

    void getcurrentuser(){
      try {
        final user= _auth.currentUser;
      if (user!=null) {
        signinuser=user;
        print(signinuser.email);
      }
      } catch (e) {
        print(e);
      }
    }  

    void getmessages()async
    {
      final messages= await _firestore.collection("messages").get();
      for(var message in messages.docs){
        print(message.data());
      }
    }

    void messagesStreams()async{
      await for(var snapshot in _firestore.collection("messages").snapshots()){
        for(var message in snapshot.docs){
          print(message.data());
        }
      }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: Row(children: [
          Image.asset("lib/images/message.png",height: 25),
          SizedBox(width: 10),
          Text("Message_Me"),
        ]),
        actions: [
          IconButton(onPressed: (() {
            _auth.signOut();
            Navigator.pop(context);
            
          }), icon: Icon(Icons.close))
        ],
      ),
      body: SafeArea(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        messagestreambuilder(),
        Container(
          decoration: BoxDecoration
          (
            border: Border(top:
           BorderSide
           (color: Colors.orange,width: 2))),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Expanded(
              child: TextField(
                controller: messagetextcontroller,
              onChanged: (value) {
                messageText=value; 
                
              },
              decoration: InputDecoration
              (contentPadding: EdgeInsets.symmetric
              (horizontal:20 
              ,vertical: 10),
              hintText: "Writer your message here",border: InputBorder.none),
              
            ),
            ),
            TextButton(onPressed: () {
              messagetextcontroller.clear();
              _firestore.collection("messages").add({
                "text":messageText,
                "sender":signinuser.email,
                "time":FieldValue.serverTimestamp(),
              });
            },
            child: Text("Send",style: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.bold,fontSize: 18),),)
           ]),
        ),
      ],)),
    );
  }
}
class messagestreambuilder extends StatefulWidget {
  const messagestreambuilder({super.key});

  @override
  State<messagestreambuilder> createState() => _messagestreambuilderState();
}

class _messagestreambuilderState extends State<messagestreambuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>
        (
          stream: _firestore.collection("messages").orderBy("time").snapshots(),
          builder:(context, snapshot) {
            List<MessageLine> messagewidgets=[];
            if (!snapshot.hasData) {
              // add snipper
            } 

            final messages =snapshot.data!.docs.reversed;
             for (var message in messages) {
               final messagetext=message.get("text");
               final messageemail=message.get("sender");
               final currentuser=signinuser.email; 
               final messagewidget= MessageLine(text: messagetext,sender: messageemail, isme: currentuser==messageemail,);
               messagewidgets.add(messagewidget);
             }
            return Expanded(
              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                children: messagewidgets,
              ),
            );
          },
          );
  }
}




class MessageLine extends StatelessWidget {
  const MessageLine({this.text,this.sender,required this.isme});
  final String? text;
  final String? sender;
  final bool isme;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:isme? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text("$sender",style: TextStyle(fontSize: 12,color: Colors.yellow[900]),),
          Material(
            elevation: 5,
            borderRadius:isme? BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
            :BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),),
            color:isme? Colors.blue[800]:Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Text("$text",
                         style: TextStyle(fontSize: 15,color:isme? Colors.white:Colors.black45),),
            ),
          ),
        ],
      ),
    );
  }
}














