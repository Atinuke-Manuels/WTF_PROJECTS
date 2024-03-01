import 'package:flutter/material.dart';
import 'package:fusions/features/responsive_test.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Valentine App", style: TextStyle(color: Colors.red),),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16.0), // Adjust the padding as needed
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  // Handle the image click here
                  Navigator.pushNamed(context, '/ResponsiveTest');
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      image: AssetImage('assets/roses.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text
                  Padding(
                    padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
                    child: Text(
                      "Be my valentine - Atinuke Manuels",
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );


  }
}