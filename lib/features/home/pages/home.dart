import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Dear Diary"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '');
            },
            child: Icon(Icons.search),
          ),
        ],
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/ResponsiveTest');
          },
          child: Icon(Icons.note_add),
        ),
      ),
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () { FirebaseAuth.instance.signOut(); Navigator.pushNamed(context, '/LoginPage');},
                          child: Text("Log Out", style: TextStyle(color: Colors.white),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                        ),
                      ),
                    ],
                  ),
          )),
    ));
  }
}
