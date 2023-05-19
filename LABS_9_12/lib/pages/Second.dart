import 'package:flutter/material.dart';
import 'package:labs_9_12/main.dart';
import 'package:labs_9_12/Enum.dart';


class SecondScreen extends StatefulWidget { //класс для второго экрана
  const SecondScreen({super.key, required this.title});

  final String title;

  @override
  State<SecondScreen> createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  final _formKey = GlobalKey<FormState>();

  void add_resources() { //функция добавления ресурсов
    if (_formKey.currentState!.validate()) {
      setState(() {
        coffeeMachine.fillWater(amount_water);
        coffeeMachine.fillCoffeeBeans(amount_cof);
        coffeeMachine.fillMilk(amount_milk);
        coffeeMachine.fillCash(amount_money);
      });
    }
  }

  void sub_resources() { //функция отнимания ресурсов
    if (_formKey.currentState!.validate()) {
      setState(() {
        coffeeMachine.fillWater(-amount_water);
        coffeeMachine.fillCoffeeBeans(-amount_cof);
        coffeeMachine.fillMilk(-amount_milk);
        coffeeMachine.fillCash(-amount_money);
      });
    }
  }

  var font_size = const TextStyle(fontSize: 15.0, color: Colors.grey);
  //var selected_coffee = espresso;
  //var temp_money = 0;
  var amount_cof = 0;
  var amount_milk = 0;
  var amount_water = 0;
  var amount_money = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Center(
        child: Container(
            //общий контейнер для верха кофемашины
            height: 250, //размеры поля
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.limeAccent, //цвет контейнера
            ),
            child: Column(children: [
              Container(
                //поле внутри поля
                margin: const EdgeInsets.all(20),
                //размеры нового поля
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      //вывод на экран
                      'Ресурсы',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(''),
                    Text(
                      //вывод на экран того, что осталось из ресурсов
                      'Кофейные зерна: ${coffeeMachine.resources.coffeeBeans}',
                      style: font_size,
                    ),
                    Text(
                      'Объем молока: ${coffeeMachine.resources.milk}',
                      style: font_size,
                    ),
                    Text(
                      'Объем воды: ${coffeeMachine.resources.water}',
                      style: font_size,
                    ),
                    Text(''), //разделитель текста
                    Text(
                      //вывод на экран внесенных денег
                      'Деньги: ${coffeeMachine.resources.cash}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              )
            ])),
      ),
      Center( //вторая часть экрана
          //кнопки выбора кофе
          child: Container(
              padding: EdgeInsets.all(30), //отступы
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                   TextFormField( //поле для добавления молока
                        validator: (value) {
                          //проверка ввода
                          if (value!.isEmpty) {
                            //если значение не задано
                            return 'Вы не добавили молоко'; //вывод сообщения на экран
                          }
                          try {
                            if (int.parse(value) > 0) {
                              setState(() {
                                amount_milk = int.parse(value);
                              }); //если значение больше нуля
                            } //передача значения переменной
                            else {
                              return 'Вы не добавили молоко'; //сообщение на экран
                            }
                          } catch (e) {
                            //нахождение ошибки
                            return e.toString();
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Добавить молоко',
                        ),
                        keyboardType: TextInputType.number,
                      ),

                    TextFormField( //поле для добавления воды
                        validator: (value) {
                          //проверка ввода
                          if (value!.isEmpty) {
                            //если значение не задано
                            return 'Вы не добавили воду'; //вывод сообщения на экран
                          }
                          try {
                            if (int.parse(value) > 0) {
                              setState(() {
                                amount_water = int.parse(value);
                              }); //если значение больше нуля
                            } //передача значения переменной
                            else {
                              return 'Вы не добавили воду'; //сообщение на экран
                            }
                          } catch (e) {
                            //нахождение ошибки
                            return e.toString();
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Добавить воду',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    TextFormField( //поле для добавления кофейных зерен
                        validator: (value) {
                          //проверка ввода
                          if (value!.isEmpty) {
                            //если значение не задано
                            return 'Вы не добавили кофейные зерна'; //вывод сообщения на экран
                          }
                          try {
                            if (int.parse(value) > 0) {
                              setState(() {
                                amount_cof = int.parse(value);
                              }); //если значение больше нуля
                            } //передача значения переменной
                            else {
                              return 'Вы не добавили кофейные зерна'; //сообщение на экран
                            }
                          } catch (e) {
                            //нахождение ошибки
                            return e.toString();
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Добавить кофейные зерна',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    TextFormField( //поля для работы с деньгами
                        validator: (value) {
                          //проверка ввода
                          if (value!.isEmpty) {
                            //если значение не задано
                            return 'Вы не добавили деньги'; //вывод сообщения на экран
                          }
                          try {
                            if (int.parse(value) > 0) {
                              setState(() {
                                amount_money = int.parse(value);
                              }); //если значение больше нуля
                            } //передача значения переменной
                            else {
                              return 'Вы не добавили деньги'; //сообщение на экран
                            }
                          } catch (e) {
                            //нахождение ошибки
                            return e.toString();
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Добавить деньги',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    Container( //расположение кнопок
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton( //кнопка добавления
                              onPressed: add_resources,
                              child: Icon(Icons.add)),
                          ElevatedButton( //кнопка убавления
                              onPressed: sub_resources,
                              child: Icon(Icons.do_not_disturb)),
                        ],
                      ),
                    )
                  ],
                ),
              )))
    ]);
  }
}
