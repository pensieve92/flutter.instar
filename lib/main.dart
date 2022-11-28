import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.red, size: 50),
        appBarTheme: AppBarTheme(
            color: Colors.grey,
            actionsIconTheme: IconThemeData(color: Colors.red)
        ),
    ),
      home: MyApp()
  ));


}

var textStyle = TextStyle(color: Colors.orangeAccent);



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // var iconColor = Icon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.add_box_outlined)],
      ),
        body: Container(),
      bottomNavigationBar: Container(
        child: Text('test', style: textStyle,),
      ),
      );
    }
}
