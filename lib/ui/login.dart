import 'package:flutter/material.dart';
import 'package:wedo/shared/services/firebase_auth.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = new TextEditingController(text: "");
    _passwordController = new TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = new AuthProvider();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 100.0,
              ),
              Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: "Enter Email"),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: "Enter password"),
              ),
              RaisedButton(
                child: Text("Login"),
                onPressed: () {
                  auth.signingWithEmail(
                      _emailController.text, _passwordController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
