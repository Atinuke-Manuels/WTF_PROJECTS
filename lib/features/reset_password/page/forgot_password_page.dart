
import 'package:flutter/material.dart';

import '../widgets/forgot_password_bottom_section.dart';
import '../widgets/forgot_password_top_section.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 100,),
                ForgotPasswordTopSection(),
                ForgotPasswordBottomSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
