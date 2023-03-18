import 'package:flutter/material.dart';

class Simple extends StatelessWidget {
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
          body: ListView(
            children: const [
              Text('0000'),
              Divider(),
              Text('0001'),
              Divider(),
              Text('0010'),
            ],
          )),
    );
  }
}
