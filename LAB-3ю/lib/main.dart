import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //запуск окна MyApp
}

class MyApp extends StatelessWidget { //корневой элемент
  //StatelessWidget предназначен для отображения статичных виджетов,
  // которые не изменяются во время исполнения приложения.
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Инткремент', //заголовок окна
      theme: ThemeData(   //тема приложения
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Инкремент'),
      //домашний класс приложения
    );
  }
}

class MyHomePage extends StatefulWidget { //StatefulWidget предназначен
  //для отображения изменяющихся состояний
  //виджета без видимой «перезагрузки» интерфейса.
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(); //State - отслеживание
// изменений в _MyHomePageState()
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; //создание счетчика

  void _incrementCounter() {
    setState(() { //для регистрации изменений и отображение их на экран
      _counter++; //счетчик на +1
    });
  }
  void _decrementCounter(){
    setState((){
      _counter--; //счетчик на -1
    });
  }
  void _drop(){ //сброс инкремента
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) { //отстраивание экрана (интерфейс)
    return Scaffold(
      appBar: AppBar( //верхняя строка с заголовком
        title: Text(widget.title),
      ),
      body: Center( //в основной части элементы будут расположены по центру
        child: Column( //элементы идут по очереди в колонке
          mainAxisAlignment: MainAxisAlignment.center, //выравние элементов колонки по центру
          children: <Widget>[ //элементы колонки
            const Text( //текст в приложении
              'Значение инкремента:',
            ),
            Text( //выводит значение инкремента
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
        Row( //элементы расположены в строку
          mainAxisAlignment: MainAxisAlignment.center, //элементы по центру
          children: <Widget>[ //элементы строки
            ElevatedButton( //кнопка "-"
              onPressed: _decrementCounter, //обращение к функции _decrementCounter
              child: const Text('-'), //наменование кнопки
              style: ButtonStyle( //стиль кнопки
                  backgroundColor: MaterialStateProperty.all(Colors.red), //цвет кнопки красный
                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30), //размер текста кнопки
                  ),
              ),
            ),
            ElevatedButton( //кнопка "+"
              onPressed: _incrementCounter, //обращение к функции _incrementCounter
              child: const Text('+'), //наменование кнопки
              style: ButtonStyle( //стиль кнопки
                backgroundColor: MaterialStateProperty.all(Colors.green), //цвет кнопки зеленый
                textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30), //размер текста кнопки
                ),
              ),
            ),
          ],
        ),
            TextButton( //кнопка, сбрасывающая инкремент
              onPressed: _drop, //обращение к функции _drop
                child: const Text('Cбросить'), //наменование кнопки
              style: ButtonStyle( //стиль кнопки
                foregroundColor: MaterialStateProperty.all(Colors.grey), //цвет надписи на кнопке кнопки серый
              ),
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
