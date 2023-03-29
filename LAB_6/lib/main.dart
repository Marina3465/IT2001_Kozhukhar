import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {//корневой элемент
//StatelessWidget предназначен для отображения статичных виджетов,
// которые не изменяются во время исполнения приложения.
  const MyForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  var _height; //переменная высоты
  var _width; //переменная ширины
  var _answer = null; //переменная площади
  var flag = 0; //обозначение событий

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Form(
          key: _formKey,
          child: Column( //элементы идут в колонку
            children: [
              Row( //текст и строка ввода идут в строчку
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0), //отступы текста
                    child: Text('Ширина (мм): '), //текст
                  ),
                  Expanded( //виджет для заполнения существующего пространства
                      child: Container(
                    padding: EdgeInsets.all(10.0), //отступы
                    child: TextFormField( //поле ввода
                      keyboardType: TextInputType.number, //тип клавиатуры только с числами
                      validator: (value) { //проверка ввода
                        if (value!.isEmpty) { //если значение не задано
                          setState(() {
                            flag = 1; //отслеживание флага
                          });
                          return 'Задайте ширину'; //вывод сообщения на экран
                        } else
                          setState(() {
                            flag = 0; //отсутствие флага
                          });
                        try {
                          if (double.parse(value) > 0) //если значение больше нуля
                            _width = double.parse(value); //передача значения переменной
                          else {
                            setState(() {
                              _width = null; //сброс переменной и установление флага
                              flag = 1;
                            });
                            return 'Такого не бывает!'; //сообщение на экран
                          }
                        } catch (e) { //нахождение ошибки
                          setState(() {
                            _width = null; //сброс переменной и установление флага
                            flag = 1;
                          });
                          return e.toString(); //вывод ошибки на экран
                        }
                      },
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Высота (мм): '),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(10.0),
                        child: TextFormField( //поле ввода
                          keyboardType: TextInputType.number, //тип клавиатуры только с числами
                          validator: (value) { //проверка ввода
                            if (value!.isEmpty) { //если значение не задано
                              setState(() {
                                flag = 1; //отслеживание флага
                              });
                              return 'Задайте высоту'; //вывод сообщения на экран
                            } else
                              setState(() {
                                flag = 0; //отсутствие флага
                              });
                            try {
                              if (double.parse(value) > 0) //если значение больше нуля
                                _height = double.parse(value); //передача значения переменной
                              else {
                                setState(() {
                                  _height = null; //сброс переменной и установление флага
                                  flag = 1;
                                });
                                return 'Такого не бывает!'; //сообщение на экран
                              }
                            } catch (e) { //нахождение ошибки
                              setState(() {
                                _height = null; //сброс переменной и установление флага
                                flag = 1;
                              });
                              return e.toString(); //вывод ошибки на экран
                            }
                          },
                        ),
                  ))
                ],
              ),
              SizedBox( //добавление расстояния между элементами
                height: 10.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) { //проверяем, проходят ли проверку поля ввода
                      ScaffoldMessenger.of(context).showSnackBar( //вызов всплывающего сообщения
                        const SnackBar(
                          content: Text('Форма успешно заполнена'), //тектс сообщения
                          backgroundColor: Colors.green, //цвет фона сообщения
                        ),
                      );
                      if (_width is double && _height is double) { //если в переменных есть числа
                        setState(() {
                          _answer = _width * _height; //считаем ответ
                        });
                      }
                    }
                  },
                  child: const Text( //задаем текст кнопке и цвет надписи
                    'Вычислить',
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox( //добавление расстояния между элементами
                height: 50.0,
              ),
              Text(_answer == null || //вывод текта: если все введено правильно,
                  //то выводим площадь, иначе выводим 'Задайте параметы'
                      flag == 1 ||
                      _width == null ||
                      _height == null
                  ? 'Задайте параметры'
                  : 'S = $_width * $_height = $_answer (мм2)',
              style: TextStyle(fontSize: 20.0), //увеличиваем текст
              )
            ],
          )),
    );
  }
}

void main() => runApp(MaterialApp( //запуск приложения
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Калькулятор площади')), //надпись вверху экрана
        body: const MyForm(),
      ),
    ));
