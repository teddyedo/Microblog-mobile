import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(234, 231, 220, 1),
        appBar: AppBar(
          title: Text(
            'LOGIN',
            style: TextStyle(
                color: Color.fromRGBO(232, 90, 79, 1),
                fontSize: 25,
                fontFamily: 'Poppins',
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Color.fromRGBO(217, 180, 126, 1),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Row(
            children: <Widget>[
              Expanded(child: SizedBox(),
                flex: 3,),
              Expanded(
                flex: 14,
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 200),
                      Text(
                        'Username',
                        style: TextStyle(
                          color: Color.fromRGBO(232, 90, 79, 1),
                          fontFamily: 'Roboto',
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your username',
                          focusedBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                              color: Color.fromRGBO(232, 90, 79, 1)
                            )
                          )
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(120, 119, 119, 1),
                        ),

                      ),
                      SizedBox(height: 25,),
                      Text(
                        'Password',
                        style: TextStyle(
                            color: Color.fromRGBO(232, 90, 79, 1),
                            fontFamily: 'Roboto',
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter your password',
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Color.fromRGBO(232, 90, 79, 1)
                                )
                            )
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(120, 119, 119, 1),
                        ),
                      ),
                      SizedBox(height: 100),
                      FloatingActionButton.extended(
                        onPressed: () {
                          if (_loginFormKey.currentState.validate()) {
                          }
                        },
                        backgroundColor: Color.fromRGBO(120, 119, 119, 1),
                        label: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: SizedBox(),
                flex: 3,)
            ],
          ),
        )
    );
  }
}
