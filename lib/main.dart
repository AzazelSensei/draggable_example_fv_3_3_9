import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Color _draggedColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DragTarget<Color>(
              onAccept: (Color color) {
                _draggedColor = color;
              },
              builder: (context, candidates, rejected) {
                return Container(
                  height: 100,
                  width: 100,
                  color: _draggedColor,
                );
              },
            ),
            Draggable<Color>(
              data: Colors.red,
              feedback: Container(
                height: 50,
                width: 50,
                color: Colors.red.withOpacity(0.5),
              ),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ),
            ),
            Draggable<Color>(
              data: Colors.green,
              feedback: Container(
                height: 50,
                width: 50,
                color: Colors.green.withOpacity(0.5),
              ),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.green,
              ),
            ),
            Draggable<Color>(
              data: Colors.blue,
              feedback: Container(
                height: 50,
                width: 50,
                color: Colors.blue.withOpacity(0.5),
              ),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _draggedColor = Colors.grey;
                });
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
