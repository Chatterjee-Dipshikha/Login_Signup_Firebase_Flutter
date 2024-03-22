// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:video/View/insta_signup_page.dart';

// class InstaLoginPage extends StatefulWidget {
  
//    InstaLoginPage({super.key});

//   @override
//   State<InstaLoginPage> createState() => _InstaLoginPageState();
// }

// class _InstaLoginPageState extends State<InstaLoginPage> {
// TextEditingController email=TextEditingController();

// TextEditingController password=TextEditingController();  
// final auth= FirebaseAuth.instance;
// bool passwordVisible=false; 
// @override
//    void dispose() {
//      // TODO: implement dispose //dispose to remove TextEditingController from memory
//     super.dispose();
//     email.dispose();
//     password.dispose();
//   }
//   @override
  
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('English (India)', style: TextStyle(color: Colors.grey))),
//       ),
//       body: Center
//       (
//         child: Column
//         (
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: 
//           [
//             Container
//             (
//              child: const Text('Instagram',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
//             ),
//             SizedBox(height:70),
//             Container
//             (
//               //color: Colors.amber,
//               width: 300,
              
//               child: Column
//               (
//                 children: 
//                 [
//                   TextFormField
//                   (
//                     controller: email,
//                     decoration: InputDecoration
//                     (
                      
//                       border: OutlineInputBorder(),
//                       hintText: 'phoneno.,email or username',
                      
//                     ),
//                   ),
//                   SizedBox(height:30),
//                   TextFormField
//                   (
//                     obscureText: passwordVisible,
//                     controller: password,
//                     decoration: InputDecoration
//                     (
//                       labelText: 'Password',
//                       border: OutlineInputBorder(),
//                       hintText: 'enter password',
//                       suffixIcon: IconButton(
//                         color: passwordVisible==false?Colors.red:Colors.green,
//                         icon: Icon(passwordVisible==false?Icons.visibility:Icons.visibility_off),
//                         onPressed: (){
//                           setState(() {
//                             passwordVisible=!passwordVisible;
//                           });
//                         },
//                       ),

                      
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   ElevatedButton(

//                     onPressed: () async {
//                       log(email.text);    //log to print on debug console
//                       log(password.text);
//                       //email.clear();    //clear to remove the text from UI after tap login
//                       //password.clear();

//                     final userr = auth.signInWithEmailAndPassword(email: email.text, password: password.text);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       shape: BeveledRectangleBorder(),
//                        minimumSize: Size(300, 40),
//                       backgroundColor: Colors.blue, // Background color
//                       ),
//                       child: const Text('Log in',
//                         style: TextStyle(fontSize: 20),),),


//                            TextButton(onPressed: (){
// Navigator.push(context, MaterialPageRoute(builder:(context)=>InstaRegisterPage()));
//                         }, child: Text("Don't havde any account? SIGNUP"))
//                 ],
                
//               ), 
//             ),
          
//           ],
//         ),  
//       ),
//       );

    
//   }
// }


//............................................................................................


import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video/View/home_screen.dart';
import 'package:video/View/insta_signup_page.dart';

class InstaLoginPage extends StatefulWidget {
  InstaLoginPage({super.key});

  @override
  State<InstaLoginPage> createState() => _InstaLoginPageState();
}

class _InstaLoginPageState extends State<InstaLoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool passwordVisible = false;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('English (India)', style: TextStyle(color: Colors.grey))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text('Instagram', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 70),
            Container(
              width: 300,
              child: Column(
                children: [
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'phone no., email or username',
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    obscureText: passwordVisible,
                    controller: password,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      hintText: 'enter password',
                      suffixIcon: IconButton(
                        color: passwordVisible == true ? Colors.red : Colors.green,
                        icon: Icon(passwordVisible == true ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        final userCredential = await auth.signInWithEmailAndPassword(email: email.text, password: password.text);
                        if (userCredential != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login successful')),
                            
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(userId: email.text,)));
                          // Navigate to the home page or any other page
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login failed: ${e.toString()}')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(),
                      minimumSize: Size(300, 40),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Log in',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InstaRegisterPage()));
                    },
                    child: Text("SIGNUP"),
                  )
                    ],
                  )
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => InstaRegisterPage()));
                  //   },
                  //   child: Text("Don't have an account? SIGNUP"),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
