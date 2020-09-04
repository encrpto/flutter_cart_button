import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Switcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool opened = false;
  int _count = 0;

  // functions for increment,decrement and bool value changer.
  void _incrementCounter() => setState(
        () {
          if (_count < 5) {
            _count++;
          }
        },
      );

  void _decrementCounter() => setState(
        () {
          if (_count > 0) {
            if (_count == 1) {
              opened = false;
              _count--;
            } else {
              _count--;
            }
          }
        },
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Button'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: AnimatedSwitcher(             // for animation to switch between two Expressions
          duration: Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> ok) {
            return ScaleTransition(
              child: child,
              scale: ok,
            );
          },
          child: opened         //  Condition ? expr1       : expr2         if condition true expr1 executed otherwise expr2
                                //  opened    ? Container() : ButtonTheme()
              ? Container(
                  height: 40.0,
                  width: 105.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: _decrementCounter,
                        tooltip: 'Increment',
                      ),
                      Text(
                        '$_count',
                        style: TextStyle(color: Colors.orange),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: _incrementCounter,
                        tooltip: 'Increment',
                      ),
                    ],
                  ),
                )
              : ButtonTheme(
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        opened = true;
                        _count++;
                      });
                    },
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ),
        ),
      ),
    );
  }
}
