 
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
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),           
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key});

  @override
  Widget build(BuildContext context) {
return Scaffold(
body: DottedBox(  height: 100,
          width: 100,
          );
);
  }
}
```
