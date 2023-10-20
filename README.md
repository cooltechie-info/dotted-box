[![pub package](https://img.shields.io/badge/pub-0.0.2-blue.svg)](https://pub.dev/packages/dotted_box)

A flutter package which will help you to generate dotted box. Can be useful for form designs which includes attachment sections.

## Features

- Highly customizable
- Easy to use

## Getting started

1. Import the package.

```Dart
 import 'package:dotted_box/dotted_box.dart';
```

2. Use the widget in your code.

```Dart
DottedBox(
          height: 100,
          width: 100,
        ),
```

## Usage

**This full code is from the example folder. You can run the example to see.**

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DottedBox(height: 300, width: 300),
          ],
        ),
      ),
    );
  }
}
```
