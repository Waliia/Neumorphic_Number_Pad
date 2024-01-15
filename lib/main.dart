import 'package:flutter/material.dart';

import 'num_pad.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        //backgroundColor: Colors.pink.shade300,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.deepPurple.shade200,
            Colors.deepPurple.shade400
          ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        ),
        title: const Text(
          'N U M P A D',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 70,
              child: Center(
                child: TextField(
                  controller: _controller,
                  showCursor: false,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.none,
                  style: const TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
          ),
          NumPad(
            delete: () {
              _controller.text =
                  _controller.text.substring(0, _controller.text.length - 1);
            },
            submit: () {
              debugPrint('Your text: ${_controller.text}');
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        content: Text(
                          'Your code is ${_controller.text}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ));
            },
            controlller: _controller,
            //   btnColor: Colors.purple,
            btnSize: 65,
            iconColor: Colors.black,
          )
        ],
      ),
    );
  }
}
