import 'package:flutter/material.dart';
import 'style/style.dart' as styleTheme;

void main() {
  runApp(MaterialApp(
    theme: styleTheme.theme,
      home: MyApp()
  ));
}

var textStyle = TextStyle(color: Colors.orangeAccent);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('instagram'),
        actions: [Icon(Icons.add_box_outlined, size: 30,)],
      ),
        body: Theme( // Theme로 감싸기
          data: ThemeData(
            backgroundColor: Colors.orangeAccent
          ),
          child: Container(
              child: TextButton(onPressed: (){},
                child: Text('dksusd', style: Theme.of(context).textTheme.bodyText2),)
          )
        ),
      bottomNavigationBar:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Icon(Icons.home_outlined), Icon(Icons.shopping_bag_outlined)]),
      );
    }
}
