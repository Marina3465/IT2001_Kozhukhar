import 'package:flutter/material.dart';//связь с главным окном

class Infinity extends StatelessWidget {
  //отстраивание экрана (интерфейс)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список элементов', //заголовок окна
      theme: ThemeData(
        //тема приложения
        primarySwatch: Colors.green, //цвет панели сверху
      ),
      home: Scaffold(
          appBar: AppBar(
            //верхняя строка с заголовком
            title: const Text('Список элементов'), //текст заголовка
          ),
          body: ListView.builder(itemBuilder: (context, index) {
            //создание прокручиваемого списка
            //itemBuilder обязательный параметр для конструктора
            // ListView.builder(), в качестве значения он принимает функцию, которая возвращает виджет-элемент.
            return Text('строка $index'); //возвращает текстовый виджет со
            //значением index.
          })),
    );
  }
}
