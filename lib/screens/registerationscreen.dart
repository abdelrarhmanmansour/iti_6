import 'package:chat_message/screens/chatscreen.dart';
import 'package:chat_message/widgets/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class registrationscreen extends StatefulWidget {
  static const String routescreen=' registrationscreen';
  const registrationscreen({super.key});

  @override
  State<registrationscreen> createState() => _registrationscreenState();
}

class _registrationscreenState extends State<registrationscreen> {
  final _auth= FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Container(
                  height: 180,
                  child: Image.asset("lib/images/message.png"),
    ),
    SizedBox(height: 50),
    TextField(
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      onChanged: (value) { 
        email=value;
      },
      decoration: InputDecoration(
        hintText: "Enter your email",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,vertical: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange,width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue,width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
),
SizedBox(height: 8),
TextField(
  obscureText: true,
      textAlign: TextAlign.center,
      onChanged: (value) { 
        password=value;
      },
      decoration: InputDecoration(
        hintText: "Enter your password",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,vertical: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange,width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue,width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    ),
    SizedBox(height: 10),
    mybutton(color: Colors.blue[800]!, title: "Register", onPressed: () async{
     
     try {
       final newuser= await _auth.createUserWithEmailAndPassword(email: email, password: password);
       Navigator.pushNamed(context, chatscreen.routescreen);
     } catch (e) {
       print(e);
     }
    })

    ]),
      ),
    );
  }
}