import 'package:flutter/material.dart';
import 'Machine.dart'; //ссылка на файл с классом
import 'package:labs_9_12/Enum.dart'; //ссылка на файл с перечислениями
import 'package:labs_9_12/pages/First.dart';
import 'package:labs_9_12/pages/Second.dart';

int user_cash = 0; //переменная для хранения денег пользователя
Machine coffeeMachine = Machine(); //экземпляр класса кофемашины

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee-Machine',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Navigator(title: 'Coffee Machine'),
    );
  }
}

class Navigator extends StatefulWidget{ //класс для переключения окон
  const Navigator({super.key, required this.title});

  final String title;

  @override
  State<Navigator> createState() => NavigatorState();
}

class NavigatorState extends State<Navigator> {

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown, //цвет темы
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.coffee_rounded)), //иконки окон
                Tab(icon: Icon(Icons.fire_truck_rounded))
              ],
            ),
            title: Text('Coffee Machine'),
          ),
          body: TabBarView(
            children: [
              FirstScreen(title: 'coff make',), //переключение на первое окно
              SecondScreen(title: 'resours',), //переключение на второе окно
            ],
          ),
        ),
      ),
    );
  }
}

