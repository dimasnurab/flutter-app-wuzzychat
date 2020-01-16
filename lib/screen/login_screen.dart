import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ),
              SizedBox(height: 48),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  // code is here
                  email = value;
                },
                decoration:
                    cTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(height: 18),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: cTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(height: 24),
              RoundedButton(
                title: 'Login',
                colour: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (exception) {
                    print(exception);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
