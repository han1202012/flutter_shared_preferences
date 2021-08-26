import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String textInfo = "点击按钮保存数据到 shared_preferences 中";

  _setValue() async {
    /// 先获取 SharedPreferences 实例
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      textInfo = '保存字符串 " 小王 " 到 shared_preferences 完成';
    });
    /// 将数据保存到 SharedPreferences 中
    await prefs.setString("name", "小王");
  }

  _getValue() async {
    /// 先获取 SharedPreferences 实例
    SharedPreferences prefs = await SharedPreferences.getInstance();
    /// 从 SharedPreferences 获取数据
    String? name = await prefs.getString("name");
    setState(() {
      textInfo = '从 shared_preferences 取出数据 " ${name} "';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("shared_preferences 数据访问"),
        ),
        body: Column(
          children: [
            Text(textInfo),

            ElevatedButton(
              onPressed: (){
                _setValue();
              },
              child: Text("存储数据到 shared_preferences 中"),
            ),

            ElevatedButton(
              onPressed: (){
                _getValue();
              },
              child: Text("从 shared_preferences 中获取数据"),
            ),

          ],
        ),
      ),
    );
  }
}