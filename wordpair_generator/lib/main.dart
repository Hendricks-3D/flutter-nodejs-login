import 'dart:html';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
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


class RandomWords extends StatefulWidget{
  @override 
  RandomWordsState createState() => RandomWordsState();
  }
  
  class RandomWordsState extends State<RandomWords> {

    final string_randomWordPairs = <WordPair>[];
    Widget _buildList(){

      return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, item){
                if(item.isOdd)
                   return Divider();
                final int index = item ~/2;//Calculate the number of word pai that is in the listView minus the divider widget

                //generate new pairs on scroll
                if(index>=string_randomWordPairs.length){
                  string_randomWordPairs.addAll(generateWordPairs().take(10));
                  
                }

                return _buildRow(string_randomWordPairs[index]);
              },
        );
    }

    //Widget that builds the list
    Widget build(BuildContext context){
      return Scaffold(  
         appBar:AppBar(
           title: Text('WordPair Generator')),
         body:_buildList(),
       );
    }

  //Row widgets that accepts a random word and add to the row
  Widget _buildRow(WordPair word) {

      return ListTile(
        title:Text(word.asPascalCase,
              style: 
              TextStyle(fontSize: 18.0),)
      );
  }
}