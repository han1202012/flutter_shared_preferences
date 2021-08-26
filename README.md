# flutter_shared_preferences

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


【Flutter】shared_preferences 本地存储 ( 简介 | 安装 shared_preferences 插件 | 使用 shared_preferences 流程 )
93/100
保存草稿
发布文章
han1202012
未选择任何文件

@[TOC]



<br>
<br>
<br>
<br>

# 一、shared_preferences 本地存储插件简介

---

<br>

<font color=blue>shared_preferences</font> 是 Flutter 提供的 <font color=red>本地数据存取 插件 ;

在不同的平台 , 基于不同的机制开发 , 如 <font color=blue>Android</font> 平台中基于 <font color=red>SharedPreferences</font> 开发 , <font color=green>iOS</font> 平台中基于<font color=magenta> NSUserDefaults</font> 开发 ;

访问本地文件是耗时操作 , 因此访问 shared_preferences  存储是一个 <font color=purple>异步操作 ;




<br>
<br>
<br>
<br>

# 二、安装 shared_preferences 插件

---

<br>

**安装 shared_preferences 插件 :**

**shared_preferences  插件地址 :** [https://pub.dev/packages/shared_preferences](https://pub.dev/packages/shared_preferences)

按照 [https://pub.dev/packages/shared_preferences/install](https://pub.dev/packages/shared_preferences/install) 地址的安装教程进行安装 ;


首先 , 在 pubspec.yaml 配置文件中 , 导入插件包 :

```java
dependencies:
  shared_preferences: ^2.0.7
```

然后 , 下载插件包 , 点击 Pub Get 按钮 , 下载插件包到本工程中 ;


![在这里插入图片描述](https://img-blog.csdnimg.cn/bd7463353c414594bb4ae03c067a98f2.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_Q1NETiBA6Z-p5puZ5Lqu,size_82,color_FFFFFF,t_70,g_se,x_16)

最后 , 在 Dart 代码中导入如下代码 , 即可使用 shared_preferences ;

```java
import 'package:shared_preferences/shared_preferences.dart';
```


<br>
<br>
<br>
<br>

# 三、使用 shared_preferences 流程

---

<br>

在完成了上述安装 shared_preferences 插件之后 , 才能开始使用 ;

首先 , 导入插件包 ;

```java
import 'package:shared_preferences/shared_preferences.dart';
```

然后 , 获取 shared_preferences 实例 ;

```java
final prefs = await SharedPreferences.getInstance();
```

最后 , 通过上述 shared_preferences 实例可以 设置 / 读取 存储的键值对数值 ;

```java
/// 设置值
prefs.setInt('counter', counter);

/// 获取值
final counter = prefs.getInt('counter') ?? 0;}
```

如果要删除数据 , 调用 shared_preferences 实例的 remove 方法 ;

```java
prefs.remove('counter');
```

<br>

**下图是 Flutter 的 SharedPreferences 类提供的所有方法 , 重点关注数据的访问方法 ;**

![在这里插入图片描述](https://img-blog.csdnimg.cn/aaeb62c122ba4a06b23ed26d0e0128bd.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_Q1NETiBA6Z-p5puZ5Lqu,size_25,color_FFFFFF,t_70,g_se,x_16)

**数据存储示例 :**

```java
  _setValue() async {
    /// 先获取 SharedPreferences 实例
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      textInfo = '保存字符串 " 小王 " 到 shared_preferences 完成';
    });
    /// 将数据保存到 SharedPreferences 中
    await prefs.setString("name", "小王");
  }
```


数据访问示例 :

```java
  _getValue() async {
    /// 先获取 SharedPreferences 实例
    SharedPreferences prefs = await SharedPreferences.getInstance();
    /// 从 SharedPreferences 获取数据
    String? name = await prefs.getString("name");
    setState(() {
      textInfo = '从 shared_preferences 取出数据 " ${name} "';
    });
  }
```




<br>
<br>
<br>
<br>

# 四、完整代码示例

---

<br>



```java
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
```


**执行结果 :**

![请添加图片描述](https://img-blog.csdnimg.cn/2819ebba1ec24ff4ada0cdac34b4c6d1.gif)

















<br>
<br>
<br>
<br>

# 五、相关资源

---

<br>


**参考资料 :**
 - **Flutter 官网 :** [https://flutter.dev/](https://flutter.dev/)
 - **Flutter 插件下载地址 :**  [https://pub.dev/packages](https://pub.dev/packages)
 - **Flutter 开发文档 :** [https://flutter.cn/docs](https://flutter.cn/docs) **( 强烈推荐 )**
 - **官方 GitHub 地址** : [https://github.com/flutter](https://github.com/flutter)
 - **Flutter 中文社区 :** [https://flutter.cn/](https://flutter.cn/)
 - **Flutter 实用教程 :** [https://flutter.cn/docs/cookbook](https://flutter.cn/docs/cookbook)
 - **Flutter CodeLab :** [https://codelabs.flutter-io.cn/](https://codelabs.flutter-io.cn/)
 - **Dart 中文文档 :** [https://dart.cn/](https://dart.cn/)
 - **Dart 开发者官网 :** [https://api.dart.dev/](https://api.dart.dev/)
 - **Flutter 中文网 :** [https://flutterchina.club/](https://flutterchina.club/) , [http://flutter.axuer.com/docs/](http://flutter.axuer.com/docs/)
 - **Flutter 相关问题 :** [https://flutterchina.club/faq/](https://flutterchina.club/faq/) ( 入门阶段推荐看一遍 )
 - **GitHub 上的 Flutter 开源示例 :** [https://download.csdn.net/download/han1202012/15989510](https://download.csdn.net/download/han1202012/15989510)
 - **Flutter 实战电子书 :** [https://book.flutterchina.club/chapter1/](https://book.flutterchina.club/chapter1/)
 - **Dart 语言练习网站 :** [https://dartpad.dartlang.org/](https://dartpad.dartlang.org/)


<br>

**重要的专题 :**
 - **Flutter 动画参考文档 :** [https://flutterchina.club/animations/](https://flutterchina.club/animations/)

<br>

**博客源码下载 :**



 - **GitHub 地址 :** [https://github.com/han1202012/flutter_shared_preferences](https://github.com/han1202012/flutter_shared_preferences) ( 随博客进度一直更新 , 有可能没有本博客的源码 )

 - **博客源码快照 :** ( 本篇博客的源码快照 , 可以找到本博客的源码 )
文章目录
一、shared_preferences 本地存储插件简介
二、安装 shared_preferences 插件
三、使用 shared_preferences 流程
四、完整代码示例
五、相关资源




一、shared_preferences 本地存储插件简介

shared_preferences 是 Flutter 提供的 本地数据存取 插件 ;

在不同的平台 , 基于不同的机制开发 , 如 Android 平台中基于 SharedPreferences 开发 , iOS 平台中基于 NSUserDefaults 开发 ;

访问本地文件是耗时操作 , 因此访问 shared_preferences 存储是一个 异步操作 ;





二、安装 shared_preferences 插件

安装 shared_preferences 插件 :

shared_preferences 插件地址 : https://pub.dev/packages/shared_preferences

按照 https://pub.dev/packages/shared_preferences/install 地址的安装教程进行安装 ;

首先 , 在 pubspec.yaml 配置文件中 , 导入插件包 :

dependencies:
  shared_preferences: ^2.0.7
然后 , 下载插件包 , 点击 Pub Get 按钮 , 下载插件包到本工程中 ;

在这里插入图片描述

最后 , 在 Dart 代码中导入如下代码 , 即可使用 shared_preferences ;

import 'package:shared_preferences/shared_preferences.dart';




三、使用 shared_preferences 流程

在完成了上述安装 shared_preferences 插件之后 , 才能开始使用 ;

首先 , 导入插件包 ;

import 'package:shared_preferences/shared_preferences.dart';
然后 , 获取 shared_preferences 实例 ;

final prefs = await SharedPreferences.getInstance();
最后 , 通过上述 shared_preferences 实例可以 设置 / 读取 存储的键值对数值 ;

/// 设置值
prefs.setInt('counter', counter);

/// 获取值
final counter = prefs.getInt('counter') ?? 0;}
如果要删除数据 , 调用 shared_preferences 实例的 remove 方法 ;

prefs.remove('counter');

下图是 Flutter 的 SharedPreferences 类提供的所有方法 , 重点关注数据的访问方法 ;

在这里插入图片描述

数据存储示例 :

  _setValue() async {
    /// 先获取 SharedPreferences 实例
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      textInfo = '保存字符串 " 小王 " 到 shared_preferences 完成';
    });
    /// 将数据保存到 SharedPreferences 中
    await prefs.setString("name", "小王");
  }
数据访问示例 :

  _getValue() async {
    /// 先获取 SharedPreferences 实例
    SharedPreferences prefs = await SharedPreferences.getInstance();
    /// 从 SharedPreferences 获取数据
    String? name = await prefs.getString("name");
    setState(() {
      textInfo = '从 shared_preferences 取出数据 " ${name} "';
    });
  }




四、完整代码示例

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
执行结果 :

请添加图片描述





五、相关资源

参考资料 :

Flutter 官网 : https://flutter.dev/
Flutter 插件下载地址 : https://pub.dev/packages
Flutter 开发文档 : https://flutter.cn/docs ( 强烈推荐 )
官方 GitHub 地址 : https://github.com/flutter
Flutter 中文社区 : https://flutter.cn/
Flutter 实用教程 : https://flutter.cn/docs/cookbook
Flutter CodeLab : https://codelabs.flutter-io.cn/
Dart 中文文档 : https://dart.cn/
Dart 开发者官网 : https://api.dart.dev/
Flutter 中文网 : https://flutterchina.club/ , http://flutter.axuer.com/docs/
Flutter 相关问题 : https://flutterchina.club/faq/ ( 入门阶段推荐看一遍 )
GitHub 上的 Flutter 开源示例 : https://download.csdn.net/download/han1202012/15989510
Flutter 实战电子书 : https://book.flutterchina.club/chapter1/
Dart 语言练习网站 : https://dartpad.dartlang.org/

重要的专题 :

Flutter 动画参考文档 : https://flutterchina.club/animations/

博客源码下载 :

GitHub 地址 : https://github.com/han1202012/flutter_shared_preferences ( 随博客进度一直更新 , 有可能没有本博客的源码 )

博客源码快照 : ( 本篇博客的源码快照 , 可以找到本博客的源码 )

Markdown 5069 字数 291 行数 当前行 283, 当前列 0 文章已保存14:56:24HTML 3493 字数 130 段落
