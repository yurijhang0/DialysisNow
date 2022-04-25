import 'package:flutter/material.dart';

import '../../services/AuthService.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService auth = AuthService();
  final formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        title: Text('Sign up for DialysisNow'),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text('Register')
            )
          ]
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 50.0),
        child: Form(
          key: formKey,
            child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      }
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                      obscureText: true,
                      validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      }
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.green[400],
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                          dynamic result = await auth.registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() => error = 'please enter valid email');
                          }
                        }
                      }
                  ),
                  SizedBox(height: 12),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ],
            ),
        ),
      ),
    );
  }
}
