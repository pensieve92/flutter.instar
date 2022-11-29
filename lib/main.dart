import 'package:flutter/material.dart';
import 'style/style.dart' as styleTheme;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';


void main() {
  runApp(MaterialApp(

    theme: styleTheme.theme,
      // home: MyApp(),
    initialRoute: '/',
    routes: {
      '/': (c) => Upload(),
      '/detail': (c) => Text('상세페이지')
    },

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


  var scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    getData();

    // 리스너 등록
    scroll.addListener(() {
      print(scroll.position.pixels);
      // 현재스크롤 === 최대 스크롤
      if(scroll.position.pixels == scroll.position.maxScrollExtent){
        print('같음');
        var result = http.get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
      }


    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('instagram'),
        actions: [IconButton(
            icon: Icon(Icons.add_box_outlined, size: 30,),
        onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Upload())          );
                },
      )],
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

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('이미지업로드화면'),
            IconButton(
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/detail");

                },
                icon: Icon(Icons.close)
            ),
          ],
        )
    );

  }
}
