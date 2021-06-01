import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPair>[];
  final _savedWordPairs = Set<
      WordPair>(); //A set is a collection of object whereneach object is unique.

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();
        //Calculate the number of word pai that is in the listView minus the divider widget
        final int index = item ~/ 2;

        //generate new pairs on scroll
        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );
  } //End _buildList Widget

//----Widget that builds the list
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WordPair Generator'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: _pushSaved(),
        )
      ]),
      body: _buildList(),
    );
  }

  _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair word) {
        return ListTile(
            title: Text(word.asPascalCase, style: TextStyle(fontSize: 16.0)));
      });
      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
          appBar: AppBar(
            title: Text('Saved Words'),
          ),
          body: ListView(children: divided));
    }));
  }

  //-----Row widgets that accepts a random word and add to the row
  Widget _buildRow(WordPair word) {
    final alreadySaved = _savedWordPairs.contains(word);

    return ListTile(
      title: Text(
        word.asPascalCase,
        style: TextStyle(fontSize: 18.0),
      ),
      trailing: Icon(
          alreadySaved
              ? Icons.favorite
              : Icons.favorite_border, //add icon if pair is already saved
          color: alreadySaved
              ? Colors.red
              : null), //add color if pair is already saved using ternary operation on the color widget

      onTap: () {
        setState(() {
          if (alreadySaved) {
            _savedWordPairs.remove(word);
          } else {
            _savedWordPairs.add(word);
          }
        });
      },
    );
  }
}
