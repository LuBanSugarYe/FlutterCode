import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //调用随机生成方法
    final wordPair = new WordPair.random();

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
      theme: new ThemeData(
        primaryColor: Colors.green,
        dividerColor: Colors.greenAccent,
      ),
    );
  }
}

class RandomWordsState extends State<RandomWords>{
  //定义变量
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();


  Widget _buildSuggestions(){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context,i){
          if(i.isOdd) return Divider();

          final index = i ~/ 2;
          if(index >=_suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

    Widget _buildRow(WordPair pair){
    final alreadSaved = _saved.contains(pair);

      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alreadSaved ? Icons.favorite : Icons.favorite_border,
          color: alreadSaved ? Colors.red : null,
        ),
        onTap:(){
          setState(() {
            if(alreadSaved){
              _saved.remove(pair);
            }else{
              _saved.add(pair);
            }
          });
        },
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context){
            final tiles = _saved.map(
                (pair){
                  return new ListTile(
                    title: new Text(
                      pair.asPascalCase,
                      style: _biggerFont,
                    ),
                  );
                }
            );

            final divided = ListTile
            .divideTiles(
                context: context,
                tiles: tiles
            ).toList();

            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Saved Suggestions'),
              ),
              body: new ListView(children: divided),
            );
          }
      )
    );
  }

}

class RandomWords extends StatefulWidget{
  State<StatefulWidget> createState(){
    return new RandomWordsState();
  }
}



