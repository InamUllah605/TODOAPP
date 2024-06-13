import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoo_app/View/Home%20Screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.push(context, CupertinoPageRoute(builder: (context)=>Home()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.green,
      body: Center(child: Text('To Doo',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
    );
  }
}
