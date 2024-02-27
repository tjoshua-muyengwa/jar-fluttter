// main.dart
import 'dart:ffi' as ffi;
import 'dart:io';

import 'package:flutter/material.dart';

typedef RunJarFunc = ffi.Void Function();
typedef RunJar = void Function();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter with JAR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void runJar() {
    // Determine the path to the JAR file
    String jarPath = '';
    if (Platform.isWindows) {
      jarPath = 'libs\\hello.jar';
    } else if (Platform.isLinux) {
      jarPath = 'libs/hello.jar';
    } else if (Platform.isMacOS) {
      jarPath = 'libs/hello.jar';
    }

    // Execute JAR file
    Process.run('java', ['-jar', jarPath]).then((ProcessResult results) {
      print(results.stdout);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter with JAR'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: runJar,
          child: Text('Run JAR'),
        ),
      ),
    );
  }
}
