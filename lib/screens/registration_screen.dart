import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner, // starts false, then true when user registers
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo', // Ending Hero, needs to match starting!!!
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  pass = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                btnColor: Colors.blueAccent,
                title: 'Register',
                fun: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  print(email);
                  print(pass);
                  try {
                    final newUser =  await _auth.createUserWithEmailAndPassword(email: email, password: pass); //auth users with values
                    if (newUser != null){
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() { //Spinner stops after firebase creates user
                      showSpinner = false;
                    });
                  }
                  catch (e) {
                    print(e);
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
