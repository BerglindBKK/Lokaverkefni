import 'package:flutter/material.dart';

//widget for a floating button
class FloatingActionButton extends StatelessWidget {

  FloatingActionbutton({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('GeeksforGeeks')),
      //body: const Center(
      //  child: Text(
      //    "Welcome to GeeksforGeeks!!!",
      //    style: TextStyle(
      //      color: Colors.black,
      //      fontSize: 40.0,
      //    ),
      //  ),
      //),
      //floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: const Icon(Icons.add),
        //onPressed: () {
        // action on button press
        //},
      ),
    );
  }
}