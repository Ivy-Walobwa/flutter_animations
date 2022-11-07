import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Animations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool opaque = true;
  void animate() {
    setState(() {
      opaque = !opaque;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffB9125D),
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          width: opaque ? 200 : 100,
          height: opaque ? 100 : 200,
          color: opaque ? Colors.greenAccent : Colors.amberAccent,
          child: const Icon(
            Icons.favorite,
            size: 100,
            color: Color(0xffB9125D),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffB9125D),
        onPressed: animate,
        child: const Icon(Icons.touch_app),
      ),
    );
  }
}
