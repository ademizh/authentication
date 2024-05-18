import 'package:ecoaware/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecoaware/components/text_field.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

void signIn () async{
  showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
 // try sign in
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailTextController.text,
      password: passwordTextController.text,
    );

  // pop loading circle
    if (context.mounted) Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
  // pop loading circle
    Navigator.pop(context);
  // display error message
    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => AlertDialog(
        title: Text(e.code),
      ), // AlertDialog
    ); 
  }
}

// display a dialog message
void displayMessage(String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(message),
    ), // AlertDialog
  ); // showDialog
}


@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[300],
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:25.0),
        child: Center(
          child: Column( // Use Column, Row, or another widget that can hold multiple children
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50),
              Text(
                    'Welcome back, you’ve been missed!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
              ),
              const SizedBox(height: 25),
                // email textfield
              MyTextField(
                controller: emailTextController,
                hintText: 'Email',
                obscureText: false,
              ),
               const SizedBox(height: 10),
                // email textfield
              MyTextField(
                controller: passwordTextController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              MyButton(
                onTap: signIn, 
                text: 'Sign in',
                
              
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),

              // ... you can add more widgets here
            ],
          ),
        ),
      ),
    ),
  );
}
}