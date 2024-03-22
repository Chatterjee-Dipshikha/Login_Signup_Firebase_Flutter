import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video/View/home_screen.dart';
import 'package:video/View/insta_login_page.dart';

class LoginCheck extends StatelessWidget {
  const LoginCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        else{
          if(snapshot.hasData){
            return const HomeScreen(userId: "userId");
          }
          else{
            return InstaLoginPage();
          }
        }
      },
    );
  }
}

//hasdata
//logout button