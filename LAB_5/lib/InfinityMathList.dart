import 'package:flutter/material.dart';
import 'dart:math';

class InfMain extends StatelessWidget {
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
            double ind = index.toDouble();
            double? value = pow(2.0, ind) as double?;
            return ListTile(
              title: Text('2 ^ $index = $value'),
            );
          })),
    );
  }
}
