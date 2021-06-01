import 'dart:html';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'random_word.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
     //final wordPair = WordPair.random();//creates a single word pair randomly

     return MaterialApp(
       theme:ThemeData(primaryColor: Colors.purple[900]),
       home: RandomWords());
        
  }
}
