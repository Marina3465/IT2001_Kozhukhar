import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainScreen(),
  ));
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Возвращение значения')),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              },
              child: Text('Приступить к выбору...'))),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Выберите любой вариант')),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar( //вызов всплывающего сообщения
                  const SnackBar(
                    content: Text('Да!'), //тектс сообщения
                    backgroundColor: Colors.black, //цвет фона сообщения
                  ),
                );
                Navigator.pop(context);
              },
              child: Text('Да!')),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar( //вызов всплывающего сообщения
                  const SnackBar(
                    content: Text('Нет.'), //тектс сообщения
                    backgroundColor: Colors.black, //цвет фона сообщения
                  ),
                );
                Navigator.pop(context);
              },
              child: Text('Нет.'))
        ],
      )),
    );
  }
}
