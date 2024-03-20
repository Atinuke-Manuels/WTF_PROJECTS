import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fusions/features/login/widgets/text_input_field.dart';

import '../../login/widgets/button_item.dart';
import '../../user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class LoginTopSection extends StatefulWidget {
  const LoginTopSection({
    super.key,
  });

  @override
  State<LoginTopSection> createState() => _LoginTopSectionState();
}

class _LoginTopSectionState extends State<LoginTopSection> {
  bool isSigning = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose(){
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Login",
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              "Enter your email & password",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextInputField(
            // label: 'Email Address',
            hint: 'Enter your email',
            controller: _emailAddressController,
            leading: Icon(
              Icons.email_outlined,
              color: Colors.grey.shade500,
              size: 20,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 25,
          ),
          TextInputField(
            // label: 'Password',
            hint: 'Password',
            controller: _passwordController,
            leading: Icon(
              Icons.lock_outline_rounded,
              color: Colors.grey.shade500,
              size: 20,
            ),
            keyboardType: TextInputType.text,
            obscure: true,
            trailing: Icon(
              Icons.visibility_off_sharp,
              color: Colors.grey.shade500,
              size: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/ForgotPasswordPage');
                },
                child: Text(
                  "Reset Your Password",
                  style: TextStyle(color: Colors.grey.shade600),
                )),
          ),
          SizedBox(
            height: 40,
          ),
          // Display progress indicator when signing in
          ButtonItem(
            title: isSigning
                ? SizedBox(
              height: 20, // Adjust the height as needed
              width: 20, // Adjust the width as needed
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2, // Adjust the strokeWidth as needed
              ),
            )
                : Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            onPress: () => _signIn(),
            buttonWidth: MediaQuery.of(context).size.width * 0.95,
          ),
          //     : ButtonItem(
          //   title: "LOG IN",
          //   onPress: () {
          //     setState(() {
          //       isSigning = true; // Set signing state to true
          //     });
          //     _signIn(); // Start sign-in process
          //   },
          //   buttonWidth: MediaQuery.of(context).size.width * 0.75,
          // ),
        ],
      ),
    );
  }

  void _signIn() async {
    setState(() {
      isSigning = true; // Reset signing state
    });

    String email = _emailAddressController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if(user != null){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User Successfully Signed In")),
      );
      Navigator.pushNamed(context, '/MyHomePage');
    } else {
      print('An error occurred');
    }

    setState(() {
      isSigning = false; // Reset signing state
    });
  }
}