import 'package:flutter/material.dart';
import 'style/style.dart' as styleTheme;
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(MaterialApp(
    theme: styleTheme.theme,
      home: MyApp()
  ));
}

var textStyle = TextStyle(color: Colors.orangeAccent);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  var tab = 0;
  var dataList = [];
  var tabList = [];

  clickTab(value){
    setState(() {
      tab = value;
    });
  }

  getData() async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
     // TODO Dio 패키지 사용해보기
    
    print(jsonDecode(result.body));
    setState(() {
      dataList = jsonDecode(result.body);
      tabList.add(
          ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, idx){
              return Text(dataList[idx]['content'].toString() ?? 'test');
            },)
      );
    });

  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('instagram'),
        actions: [Icon(Icons.add_box_outlined, size: 30,)],
      ),
        // body: [Text('홈페이지'), Text('샾페이지')][tab],
        body: PageView.builder(
         controller: PageController(initialPage: 0),
          itemCount: 2,
          itemBuilder : (context, idx){
           return tabList[idx];
          },
        ),
      bottomNavigationBar:BottomNavigationBar(
        onTap: (value){
          print(value);
          clickTab(value);
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'ghs')
        ],)
    );
    }
}
