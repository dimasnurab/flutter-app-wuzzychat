import 'package:flutter/material.dart';
import './screen/wellcome_screen.dart';
import './screen/login_screen.dart';
import './screen/registration_screen.dart';
import './screen/chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      initialRoute: WelcomeScreen.id,
      routes: {
        // bisa menggunakan yang dibawah ini  
        // '/' :(context) => WelcomeScreen(),
        // '/login' :(context) => LoginScreen(),
        // '/registration' :(context) => RegistrationScreen(),
        // '/chat' :(context) => ChatScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
