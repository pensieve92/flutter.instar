import 'package:flutter/material.dart';
import 'style/style.dart' as styleTheme;

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
  var tabList = [Text('홈페이지'), Text('샾페이지')];


  clickTab(value){
    setState(() {
      tab = value;
    });
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
