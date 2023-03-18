import 'package:flutter/material.dart';

class Infinity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список элементов',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Список элементов'),
          ),
          body: ListView.builder(itemBuilder: (context, index) {
            return Text('строка $index');
          })),
    );
  }
}
