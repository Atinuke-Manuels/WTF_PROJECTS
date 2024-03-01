import 'package:flutter/material.dart';
import 'package:fusions/features/login/widgets/text_input_field.dart';


class LoginTopSection extends StatelessWidget {
  const LoginTopSection({
    super.key,
  });

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
              "Enter your username & password",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextInputField(
            // label: 'Email Address',
            hint: 'Enter your username',
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
        ],
      ),
    );
  }
}