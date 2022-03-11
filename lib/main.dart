import 'package:flutter/material.dart';
import 'package:lab4/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CTSE Lab 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Agify",
              style: TextStyle(
                fontSize: 24,

              ),
            ),
          ),
          body: const Home(),
          backgroundColor: Colors.yellow[200],
        )
    );
  }
}

