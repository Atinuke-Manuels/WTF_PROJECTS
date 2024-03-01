import 'package:flutter/material.dart';

import '../widgets/login_bottom_section.dart';
import '../widgets/login_top_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, });


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: Column(
              children: [
                LoginTopSection(),
                LoginBottomSection()
              ],
            ),
          ),

        ),
      ),
    );
  }
}
