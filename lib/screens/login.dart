import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                context.navigator.pop();
              },
            ),
          ),
          Center(
            child: LoginForm(),
          ),
        ],
      ),
    );
  }
}
