import 'package:flutter/material.dart';

class SqurePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '闲时首页',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TimeFreeMainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class TimeFreeMainPage extends StatefulWidget {
  TimeFreeMainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TimeMainPageState createState() => _TimeMainPageState();
}

class _TimeMainPageState extends State<TimeFreeMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '广场:',
            ),
            Text(
              '广场:',
            ),
            Text(
              '广场:',
            ),
          ],
        ),
      ),
    );
  }
}
