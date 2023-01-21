import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:focus_mask/focus_mask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'FocusMask demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum FocusType { square, circle, rectangle, offset }

class _MyHomePageState extends State<MyHomePage> {
  FocusType focusType = FocusType.circle;
  Offset? tapPoint;
  double slider = 50.0;

  void changetype(FocusType type) {
    setState(() {
      focusType = type;
    });
  }

  Widget mask() {
    switch (focusType) {
      case FocusType.circle:
        return FocusMask.circle(
          point: tapPoint,
          radius: slider * 2,
        );
      case FocusType.square:
        return FocusMask.square(
          point: tapPoint,
          size: slider * 3,
        );
      case FocusType.rectangle:
        return FocusMask.rectangle(
          point: tapPoint,
          width: slider * 3,
          height: slider * 2,
        );
      case FocusType.offset:
        return FocusMask.offset(
          offset: EdgeInsets.symmetric(
            vertical: slider,
            horizontal: slider,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/test.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTapDown: (details) {
                setState(() {
                  tapPoint = Offset(details.localPosition.dx, details.localPosition.dy);
                });
              },
              child: mask(),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Theme(
              data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.white,
                  disabledColor: Colors.white,
                  textTheme: Theme.of(context).textTheme.copyWith(
                        subtitle1: const TextStyle(color: Colors.white),
                      )),
              child: Container(
                color: Colors.black.withOpacity(0.7),
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile(
                        value: FocusType.circle,
                        groupValue: focusType,
                        onChanged: (value) {
                          changetype(FocusType.circle);
                        },
                        title: const Text('Circle'),
                      ),
                      RadioListTile(
                        value: FocusType.square,
                        groupValue: focusType,
                        onChanged: (value) {
                          changetype(FocusType.square);
                        },
                        title: const Text('Square'),
                      ),
                      RadioListTile(
                        value: FocusType.rectangle,
                        groupValue: focusType,
                        onChanged: (value) {
                          changetype(FocusType.rectangle);
                        },
                        title: const Text('Rectangle'),
                      ),
                      RadioListTile(
                        value: FocusType.offset,
                        groupValue: focusType,
                        onChanged: (value) {
                          changetype(FocusType.offset);
                        },
                        title: const Text('Offset'),
                      ),
                      Slider(
                        value: slider,
                        max: 100,
                        onChanged: (value) {
                          setState(() {
                            slider = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
