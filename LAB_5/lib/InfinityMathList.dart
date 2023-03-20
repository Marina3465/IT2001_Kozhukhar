import 'package:flutter/material.dart'; //связь с главным окном
import 'dart:math'; // подключение функции математического расчета

class InfMain extends StatelessWidget {
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
            double ind = index.toDouble(); //конвертирование index в друго тип данных (num -> double)
            double? value = pow(2.0, ind) as double?; //расчет значения в типе данных double (после 2^62
            // не может расчитать значение, так как память в num маленькая, потому перевела в double)
            return ListTile(
              //возвращаем результат функции в виджет элемент-списка
              //с виджетом текста:
              title: Text('2 ^ $index = $value'),
            );
          })),
    );
  }
}
