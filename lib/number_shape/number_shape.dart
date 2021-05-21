import 'package:demo_app_3/number_shape/processing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Shape',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Number Shape'),
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

  final TextEditingController _myController1 = new TextEditingController();


  // void _increment() {
  //   setState(() {});
  // }

  @override
  void dispose() {
    _myController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Insert a number to find out if it is square or cube:',
                style: TextStyle(fontSize: 20, letterSpacing: 0.2),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    borderSide: BorderSide(width: 1, color: Colors.blueGrey),
                  ),
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus
                          ? Colors.grey
                          : Colors.blueAccent),
                  labelText: "Number ::",
                ),
                keyboardType: TextInputType.number,
                controller: _myController1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: Text(getNumberShape(numberString : _myController1.text.toString())));
              });
        },
        tooltip: 'Increment',
        child: Icon(Icons.agriculture_outlined),
      ),
    );
  }
}
