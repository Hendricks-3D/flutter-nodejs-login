import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Models/user.dart';
import 'Signup.dart';
import 'Test.dart';
import 'Services/authServices.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Navigator routes setup
      routes: <String, WidgetBuilder>{
        '/test': (BuildContext context) => new TestPage(),
        '/signup': (BuildContext context) => new SignupPage(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User user = new User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(children: <Widget>[
              //Hello text container
              Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text('Hello',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold))),
              //There text container
              Container(
                  padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                  child: Text('There',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold))),

              //Dot text container
              Container(
                  padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                  child: Text('.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green))),

              //text field container
              Container(
                  padding: EdgeInsets.only(top: 300.5, left: 20.0, right: 20.0),
                  child: Column(children: <Widget>[
                    //Email text field
                    TextField(
                        controller: this.user.nameController,
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
                      controller: this.user.passwordController,
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
                    SizedBox(height: 5.0), //Gives space between two widgets

                    //forgot password link/ InkWell
                    Container(
                        alignment: Alignment(1.0, 0.0), //align right
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                            child: Text('Forgot Password',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: Colors.green)))),

                    SizedBox(height: 40.0), //Gives space between two widgets

                    //Login Button
                    Container(
                        height: 40.0,
                        child: Material(
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                AuthServices()
                                    .login(this.user.nameController.text,
                                        this.user.passwordController.text)
                                    .then((val) {
                                  if (val.data['success']) {
                                    this.user.token = val.data['token'];
                                    Fluttertoast.showToast(
                                        msg: 'Login Successful',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.grey[600],
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'authentication failed',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.grey[600],
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                });
                              },
                              child: Center(
                                child: Text('LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ),
                            ))),

                    SizedBox(height: 20.0), //Gives space between two widgets
                    //Facebook login button
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
                              Center(
                                child: ImageIcon(AssetImage('facebook.png')),
                              ),
                              SizedBox(width: 10.0), //Gives space
                              //adding the text
                              Center(
                                  child: Text('Log in With Facebook',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')))
                            ],
                          ),
                        )),

                    SizedBox(height: 15.0), //Gives space between two widgets
                    //Footer link
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('New To Spotify',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                              )),
                          SizedBox(width: 5.0),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/signup');
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ))
                        ])
                  ])),
            ]),
          )
        ]));
  }
}
