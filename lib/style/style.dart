import 'package:flutter/material.dart';

// var _var1; // 언더바변수(_)는 다른 파일에서 갖다 쓰는것을 방지함

var theme = ThemeData(
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.grey,
    )
  ),
  iconTheme: IconThemeData(color: Colors.red, size: 50),
  appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 1, // 그림자 크기
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
      actionsIconTheme: IconThemeData(color: Colors.black)
  ),
);


