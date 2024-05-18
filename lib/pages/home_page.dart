import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
void signOut (){
  FirebaseAuth.instance.signOut();
}
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("The Wall"),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: Icon(Icons.logout),
           ),
        ],
      ),
      // Scaffold
    );
  }
}
