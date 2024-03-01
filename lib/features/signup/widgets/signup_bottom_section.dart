import 'package:flutter/material.dart';

import '../../login/widgets/button_item.dart';

class SignUpBottomSection extends StatelessWidget {
  const SignUpBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ButtonItem(
              title: "SIGN UP",
              onPress: () {
                Navigator.pushNamed(context, '/LoginPage');
              },
              buttonWidth: MediaQuery.of(context).size.width * 0.75),
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Text("Or SignUp Using", style: TextStyle(color: Colors.grey.shade600, fontSize: 16),),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(image: AssetImage("assets/google1.jpg",), height: 40, width: 40,),
                Image(image: AssetImage("assets/apple.png"), height: 40, width: 40,),
                Image(image: AssetImage("assets/facebook2.png"), height: 40, width: 40,),
              ],
            ),
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already Have An Account? ", style: TextStyle(color: Colors.grey.shade600, fontSize: 16),),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/LoginPage');
                  },
                  child: Text("Log In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),))
            ],
          )
        ],
      ),
    );
  }
}
