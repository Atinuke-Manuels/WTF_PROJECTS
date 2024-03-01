import 'package:flutter/material.dart';

import '../../login/widgets/text_input_field.dart';

class SignUpTopSection extends StatelessWidget {
  const SignUpTopSection({super.key});

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
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextInputField(
            // label: 'User Name',
            hint: 'User Name',
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
        ],
      ),
    );
  }
}
