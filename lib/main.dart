import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:video/View/insta_login_page.dart';
import 'package:video/View/login_check.dart';
import 'package:video/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 71, 221, 184)),
        useMaterial3: true,
      ),
      home: LoginCheck(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(color:Colors.grey,width: double.infinity,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 50,
              color: Colors.red,

            ),
            Container(
              height: 80,
              width: 70,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Cricket'
                  ),
                  Text(
                    'Date:08-02-2024'
                  ),
                  Text(
                    'Time:01:25am'
                  )
                ],
              ),
            )
          ],
        
        
      ))),
      
    );
  }
}
