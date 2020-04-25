import 'package:flutter/material.dart';
import 'package:climate_x/screen/loadingScreen.dart';

void main() {
  runApp(MyClimaX());
}

class MyClimaX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      //debugShowCheckedModeBanner: true,
      home: LoadScreen() ,
    );
  }
}



