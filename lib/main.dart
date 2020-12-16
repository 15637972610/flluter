import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:study_demo/time/LiveliHoodPage.dart';
import 'package:study_demo/time/MePage.dart';
import 'package:study_demo/time/SqurePage.dart';
import 'dart:convert';
import 'dart:io';

import 'package:study_demo/time/TimeFreePage.dart';
import 'time/YocWebPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: '梨涡'),
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
  int currentIndex;
  final pages = [YocWebPage(),LiveliHoodPage(),SqurePage(),MePage()];
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.home),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Icon(Icons.message),
      title: Text("生活"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Icon(Icons.message),
      title: Text("圈子"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Icon(Icons.message),
      title: Text("我的"),
    ),
  ];

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
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _changePage(index);
        },
      ),
      body: pages[currentIndex],
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
