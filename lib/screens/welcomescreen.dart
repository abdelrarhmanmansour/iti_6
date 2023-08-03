import 'package:chat_message/screens/registerationscreen.dart';
import 'package:chat_message/screens/signinscreen.dart';
import 'package:flutter/material.dart';
import '../widgets/mybutton.dart';
class welcomescreen extends StatefulWidget {
  static const String routescreen=' welcomescreen';
  const welcomescreen({super.key});

  @override
  State<welcomescreen> createState() => _welcomescreenState();
}

class _welcomescreenState extends State<welcomescreen> {
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
          Column(
            children: [
              Container(
                height: 180,
                child: Image.asset("lib/images/message.png"),
              ),
              Text("Message_Me",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900,color: Color(0xff2e386b)),)
            ],
          ),
          SizedBox(height: 30),
          mybutton(
            color: Colors.yellow[900]!,
            title: "Sign in",
            onPressed: (){
              Navigator.pushNamed(context, signinscreen.routescreen);
            },
          ),
          mybutton(color:Colors.blue[800]!, title: "Register", onPressed: (){
            Navigator.pushNamed(context, registrationscreen.routescreen);
            })
      ],
      ),
      ),
    );
  }
}

