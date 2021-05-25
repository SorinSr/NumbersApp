import 'package:demo_app_3/guess_my_number/processing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
  generateNumber();
}

void generateNumber() {
  _generatedNumber = new Random().nextInt(100);
  print("GENERATED NUMBER " + _generatedNumber.toString());
}

int _generatedNumber = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess my number',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),


                          home:      MyHomePage(title:
                          'Guess my number'),

                        );
                      }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _myController1 = new TextEditingController();
  String _stringHint = "Test Hint Text";

  @override
  void dispose() {
    _myController1.dispose();
    super.dispose();
  }

  void showAlertWindow() {
    if (showAlert == true) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Goood!",
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    _stringHint,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text("Ok."),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop("Dialog");
                      },
                    ),
                    TextButton(
                      child: const Text("Reset"),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop('dialog');
                        _myController1.clear();
                        main();
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    } else {
      showAlert = false;
    }
    showAlert = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Try your luck"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Insert a number from 1 to 100 and see if you can guess my number!',
                style: TextStyle(fontSize: 20, letterSpacing: 0.2),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                _stringHint,
                style: TextStyle(fontSize: 20, wordSpacing: 0.1),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Card(
                elevation: 30,
                shadowColor: Colors.lightGreen,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.adjust_rounded),
                      title: Text(
                        "Try a number!",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 45),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _myController1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text("Guess", style: TextStyle(fontSize: 16)),
                          onPressed: () {
                            setState(() {
                              _stringHint = validateNumber(
                                  userNumber: int.parse(_myController1.text.toString()),
                                  generatedNumber: _generatedNumber);
                              showAlertWindow();
                            });
                            print("Guessed number by user is : " + _myController1.text.toString());
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.clear, color: Colors.lightGreen),
                          onPressed: () {
                            _myController1.clear();
                            main();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
