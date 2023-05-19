import 'package:flutter/material.dart';
import 'package:labs_9_12/main.dart';
import 'package:labs_9_12/Enum.dart';
import 'package:labs_9_12/Machine.dart';
import 'package:labs_9_12/Coffee.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key, required this.title});

  final String title;

  @override
  State<FirstScreen> createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> { //класс для первой страницы
  final _formKey = GlobalKey<FormState>();

  void add_money() { //функция внесения денег пользователем
    if (_formKey.currentState!.validate()) {
      setState(() {
        user_cash += temp_money;
      });
    }
  }

  void sub_money() { //функция возврата денег пользователем
    if (_formKey.currentState!.validate()) {
      setState(() {
        user_cash -= temp_money;
      });
    }
  }

  var font_size = const TextStyle(fontSize: 15.0, color: Colors.grey); //переменная для задания стиля текстам
  var selected_coffee = espresso; //выбранное кофе
  var temp_money = 0; //переменная для добавления денег

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
                  padding: const EdgeInsets.only(
                      //расположение ресурсов
                      left: 20,
                      top: 20,
                      right: 220),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  )),
              Container(
                //поле внутри поля
                margin: const EdgeInsets.all(20),
                //размеры нового поля
                height: 130,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      //вывод на экран
                      'Кофемашина',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      //вывод на экран внесенных денег
                      'Ваши деньги: $user_cash',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      //сообщение о приготовлении кофе
                      mess,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              )
            ])),
      ),
      Center(
        //кнопки выбора кофе
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    ListTile(
                      //радиокнопка эспрессо
                      title: const Text('Эспрессо 70р.'),
                      leading: Radio<Coffee>(
                        value: espresso,
                        groupValue: selected_coffee,
                        onChanged: (Coffee? value) {
                          setState(() {
                            selected_coffee =
                                value!; //запись занчения для передачи в класс
                          });
                        },
                      ),
                    ),
                    ListTile(
                      //радиокнопка капучино
                      title: const Text('Капучино 150р.'),
                      leading: Radio<Coffee>(
                        value: cappuccino,
                        groupValue: selected_coffee,
                        onChanged: (Coffee? value) {
                          setState(() {
                            selected_coffee =
                                value!; //запись занчения для передачи в класс
                          });
                        },
                      ),
                    ),
                    ListTile(
                      //радиокнопка латте
                      title: const Text('Латте 160р.'),
                      leading: Radio<Coffee>(
                        value: latte,
                        groupValue: selected_coffee,
                        onChanged: (Coffee? value) {
                          setState(() {
                            selected_coffee =
                                value!; //запись занчения для передачи в класс
                          });
                        },
                      ),
                    )
                  ],
                )),
                Container(
                  padding: EdgeInsets.all(30),
                  child: ElevatedButton(
                      //кнопка для начала приготовления кофе
                      onPressed: () async {
                        setState(() {
                          mess = 'Кофе в процессе...'; //сообщение пользователю
                        });
                        await coffeeMachine.makingCoffee(
                            selected_coffee); //обращение к функции приготовления кофе
                        setState(() {});
                      },
                      child: const Icon(Icons.play_arrow)),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(30),
                child: Form(key: _formKey,
              child:
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                        validator: (value) {
                          //проверка ввода
                          if (value!.isEmpty) {
                            //если значение не задано
                            return 'Недостаточно средств'; //вывод сообщения на экран
                          }
                          try {
                            if (int.parse(value) > 0) {
                              setState(() {
                                temp_money = int.parse(value);
                              }); //если значение больше нуля
                            } //передача значения переменной
                            else {
                              return 'Недостаточно средств'; //сообщение на экран
                            }
                          } catch (e) {
                            //нахождение ошибки
                            return e.toString();
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Деньги',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                  ),
                  ElevatedButton( //кнопка добавления денег
                      onPressed: add_money, 
                      child: Icon(Icons.monetization_on)),
                  ElevatedButton( //кнопка съема денег
                      onPressed: sub_money, 
                      child: Icon(Icons.money_off))

                ]
              )
            ))
          ],
        ),
      )
    ]);
  }
}
