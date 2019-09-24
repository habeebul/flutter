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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _buildGrid(),
      ),
    );
  }

  _buildLogic(i) {
    var squares1 = squares.sublist(0);
    print("enter ");

    print("enter else");
    squares1[i] = xIsNext ? 'X' : 'O';
    squares = squares1;
    xIsNext = !xIsNext;
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
