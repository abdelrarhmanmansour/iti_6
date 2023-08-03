
import 'package:chat_message/screens/chatscreen.dart';
import 'package:chat_message/screens/profile.dart';
import 'package:chat_message/screens/registerationscreen.dart';
import 'package:chat_message/screens/searchscreen.dart';
import 'package:chat_message/screens/signinscreen.dart';
import 'package:chat_message/screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( messageapp());
}
class messageapp extends StatelessWidget {
   messageapp({super.key});
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     title: "Mesaage_App",
      initialRoute: _auth.currentUser!=null?chatscreen.routescreen:welcomescreen.routescreen,
     routes: {
      welcomescreen.routescreen:(context) => welcomescreen(),
      signinscreen.routescreen:(context) => signinscreen(),
      registrationscreen.routescreen:(context) => registrationscreen(),
      chatscreen.routescreen:(context) => chatscreen(),
     },
    );
  }
}

