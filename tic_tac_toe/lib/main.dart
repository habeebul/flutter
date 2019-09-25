import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var valu = 'X';
  var squares = ['', '', '', '', '', '', '', '', ''];
  var xIsNext = true;
  var status = "Next Player: X";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(status),
              Expanded(child: _buildGrid()),
            ]),
      ),
    );
  }

  _buildLogic(i) {
    if (_calculateWinner() != '' || squares[i] != '') {
    } else {
      setState(() {
        squares[i] = xIsNext ? 'X' : 'O';
        xIsNext = !xIsNext;
      });
    }
    var winner = _calculateWinner();
    setState(() {
      if (winner != '') {
        status = 'Winner : ' + winner;
      } else {
        status = 'Next player: ' + (xIsNext ? 'X' : 'O');
      }
    });
  }

  _calculateWinner() {
    const lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var i = 0; i < lines.length; i++) {
      var a = lines[i][0];
      var b = lines[i][1];
      var c = lines[i][2];
      if (squares[a] != '' &&
          squares[a] == squares[b] &&
          squares[a] == squares[c]) {
        return squares[a];
      }
    }
    return '';
  }

  Widget _buildGrid() =>
      GridView.count(crossAxisCount: 3, children: _buildGridTileList(9));
  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      (i) => Container(
          child: new GestureDetector(
              onTap: () {
                _buildLogic(i);
              },
              child: new Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Text(
                    squares[i].toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )))));
}
