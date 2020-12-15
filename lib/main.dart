import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _luncher() async {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _launchURL() async {
    setState(() {
      _counter++;
    });
  }

  getWeatherData() async {
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest httpClientRequest = await httpClient.getUrl(
          Uri.parse("https://wanandroid.com/wxarticle/list/408/1/json"));
      //等待服务器返回结果
      HttpClientResponse httpClientResponse = await httpClientRequest.close();
      //使用utf8.decoder 从response 里解析数据
      var result = await httpClientResponse.transform(utf8.decoder).join();
      //输出响应头
      print(result);
      //httpClient 关闭
      httpClient.close();
    } catch (e) {
      print("请求失败：$e");
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              new WordPair.random().asPascalCase,
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline1,
            ),
            RaisedButton(
              onPressed: _luncher,
              child: new Text('data'),
            )
          ],
        ),
      ),
      floatingActionButton: new Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.green),
        child: new FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: getWeatherData,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
