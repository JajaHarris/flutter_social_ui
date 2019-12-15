import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              _backgroundImage(context),
              _title(context),
              SizedBox(height: 5),
              _credentialsTextbox(context, isPassword: false),
              SizedBox(height: 4),
              _credentialsTextbox(context, isPassword: true),
              SizedBox(height: 10),
              _loginButton(context),
              SizedBox(height: 10),
              _signUp(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _backgroundImage(BuildContext context) {
    return Image(
      height: MediaQuery.of(context).size.height / 3,
      width: double.infinity,
      image: AssetImage('assets/images/login_background.jpg'),
      fit: BoxFit.cover,
    );
  }

  Widget _title(BuildContext context) => Text(
        'FRENZY',
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0),
      );

  Widget _credentialsTextbox(BuildContext context, {bool isPassword}) {
    var hint = isPassword ? 'Password' : 'Username';
    var authIcon = isPassword ? Icons.lock : Icons.account_box;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          fillColor: Colors.white,
          filled: true,
          hintText: hint,
          prefixIcon: Icon(authIcon, size: 30),
        ),
        obscureText: isPassword,
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 60),
        alignment: Alignment.center,
        height: 45,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Login',
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5),
        ),
      ),
    );
  }

  Widget _signUp(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            height: 80,
            child: Text(
              'Don\'t have an account?  Sign up',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
