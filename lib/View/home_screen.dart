import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video/View/insta_login_page.dart';

class HomeScreen extends StatelessWidget {
  final String userId;
  const HomeScreen({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    final auth =FirebaseAuth.instance;
    return Scaffold(
      body: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: ElevatedButton(onPressed: (){
                  auth.signOut().whenComplete(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logout Successfully')),
                            
                    );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InstaLoginPage()));

                  });
                }, child: Text("Logout")),
              ),
            ),
         
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Text("Welcome: ${userId}"),
              ),
              
        ],
      )

    );
  }
}