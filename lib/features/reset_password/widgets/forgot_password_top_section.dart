import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../login/widgets/button_item.dart';
import '../../login/widgets/text_input_field.dart';


class ForgotPasswordTopSection extends StatefulWidget {
  @override
  State<ForgotPasswordTopSection> createState() => _ForgotPasswordTopSectionState();
}

class _ForgotPasswordTopSectionState extends State<ForgotPasswordTopSection> {
  final TextEditingController _emailController = TextEditingController();

  bool isSignReset = false;

  void _resetPassword(BuildContext context) async {
    setState(() {
      isSignReset = true; // Set signing state to true
    });

    String email = _emailController.text.trim();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Navigator.pushNamed(context, '/LoginPage');
      // Show success message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password reset email sent. Please check your email."),
        ),
      );
    } catch (e) {
      // Show error message if password reset fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to send password reset email. Please try again."),
        ),
      );
    }
    setState(() {
      isSignReset = false; // Set signing state to true
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Forgot Your Password?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              "Enter your email below",
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          SizedBox(height: 40),
          TextInputField(
            hint: 'Email Address',
            controller: _emailController, // Pass the controller here
            leading: Icon(
              Icons.email_outlined,
              color: Colors.grey.shade500,
              size: 20,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 40),
          ButtonItem(
            title: isSignReset
                ? SizedBox(
              height: 20, // Adjust the height as needed
              width: 20, // Adjust the width as needed
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2, // Adjust the strokeWidth as needed
              ),
            )
                : Text(
              "RESET",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            onPress: () => _resetPassword(context),
            buttonWidth: MediaQuery.of(context).size.width * 0.95,
          ),
        ],
      ),
    );
  }
}

