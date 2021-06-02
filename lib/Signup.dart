import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(Signup());
}

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup',
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(children: <Widget>[
              //Signup text container
              Container(
                  padding: EdgeInsets.fromLTRB(15.0, 115.0, 0.0, 0.0),
                  child: Text('Signup',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold))),

              //Dot text container
              Container(
                  padding: EdgeInsets.fromLTRB(270.0, 115.0, 0.0, 0.0),
                  child: Text('.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green))),

              //Email text field container
              Container(
                  padding: EdgeInsets.only(top: 300.5, left: 20.0, right: 20.0),
                  child: Column(children: <Widget>[
                    //Email text field
                    TextField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),

                            //Change textfield border to green
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)))),
                    SizedBox(height: 20.0), //Gives space between two widgets

                    //Password text field
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),

                          //Change textfield border to green
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),

                    SizedBox(height: 20.0), //Gives space between two widgets

                    //Password text field
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),

                          //Change textfield border to green
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 50.0), //Gives space between two widgets

                    //Login Button
                    Container(
                        height: 40.0,
                        child: Material(
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Center(
                                child: Text('SIGNUP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ),
                            ))),

                    SizedBox(height: 20.0), //Gives space between two widgets
                    //BACK  button
                    Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),

                          //Adding image
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //adding the text
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('BACK',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'))),
                            ],
                          ),
                        )),
                  ])),
            ]),
          )
        ]));
  }
}
