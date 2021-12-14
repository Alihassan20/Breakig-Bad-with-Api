import 'package:flutter/material.dart';
import 'package:movie/screen/details2.dart';
import 'package:movie/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Detailss.routName: (context) =>  Detailss(),
      },
      home: const Home(),
    );
  }
}
