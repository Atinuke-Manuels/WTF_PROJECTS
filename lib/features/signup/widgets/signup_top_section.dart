import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fusions/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

import '../../login/widgets/button_item.dart';
import '../../login/widgets/text_input_field.dart';

class SignUpTopSection extends StatefulWidget {
  const SignUpTopSection({super.key});

  @override
  State<SignUpTopSection> createState() => _SignUpTopSectionState();
}

class _SignUpTopSectionState extends State<SignUpTopSection> {
    bool isSigningUp = false;

    final FirebaseAuthService _auth = FirebaseAuthService();

    TextEditingController _userNameController = TextEditingController();
    TextEditingController _emailAddressController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    @override
    void dispose(){
      _userNameController.dispose();
      _emailAddressController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Create An Account",
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              "Fill your details or continue with social media",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextInputField(
            // label: 'User Name',
            hint: 'User Name',
            controller: _userNameController,
            leading: Icon(
              Icons.person,
              color: Colors.grey.shade500,
              size: 20,
            ),
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: 25,
          ),
          TextInputField(
            // label: 'Email Address',
            hint: 'Email Address',
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
          SizedBox(
            height: 40,
          ),
          ButtonItem(
            title: isSigningUp
                ? SizedBox(
              height: 20, // Adjust the height as needed
              width: 20, // Adjust the width as needed
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2, // Adjust the strokeWidth as needed
              ),
            )
                : Text(
              "SIGN UP",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            onPress: () => _signUp(),
            buttonWidth: MediaQuery.of(context).size.width * 0.95,
          ),
          // Display progress indicator when signing in
          //     : ButtonItem(
          //   title: "SIGN UP",
          //   onPress: () {
          //     setState(() {
          //       isSigningUp = true; // Set signing state to true
          //     });
          //     _signUp(); // Start sign-in process
          //   },
          //   buttonWidth: MediaQuery.of(context).size.width * 0.75,
          // ),
        ],
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true; // Reset signing state
    });

      String userName = _userNameController.text;
      String email = _emailAddressController.text;
      String password = _passwordController.text;

      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if(user != null){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User Created Successfully")),
        );
        Navigator.pushNamed(context, '/LoginPage');
      } else {
        print('An error occurred');
      }

      setState(() {
        isSigningUp = false; // Reset signing state
      });
  }
}
