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
        child: TweenAnimationBuilder(
          tween: ColorTween(
              begin: opaque ? Colors.grey : const Color(0xffB9125D),
              end: opaque ? const Color(0xffB9125D) : Colors.grey),
          duration: const Duration(seconds: 2),
          builder: (BuildContext context, Color? color, Widget? child) {
            return Icon(
              Icons.favorite,
              size: 120,
              color: color,
            );
          },
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
