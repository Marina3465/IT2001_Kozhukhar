import 'package:flutter/material.dart';
import 'Machine.dart'; //ссылка на файл с классом
import 'package:labs_9_12/Enum.dart'; //ссылка на файл с перечислениями

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  _MyHomePageState() {
    coff = coffeeMachine.resources.coffeeBeans; //назначение переменным гет
    mil = coffeeMachine.resources.milk;
    wat = coffeeMachine.resources.water;
    money = coffeeMachine.resources.cash;
  }

  Machine coffeeMachine = Machine(); //экземпляр класса кофемашины
  var amount_cof = 0;
  var amount_milk = 0;
  var amount_water = 0;
  var coff;
  var mil;
  var wat;
  var money;

  @override
  Widget build(BuildContext context) {
    //построение экрана
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              //вывод на экран того, что осталось из ресурсов
              'Кофейные зерна: $coff',
              style: TextStyle(fontSize: 15.0),
            ),
            Text(
              'Молоко: $mil',
              style: TextStyle(fontSize: 15.0),
            ),
            Text(
              'Вода: $wat',
              style: TextStyle(fontSize: 15.0),
            ),
            Text(
              'Деньги: $money',
              style: TextStyle(fontSize: 15.0),
            ),
            ElevatedButton(
                //кнопка для приготовления эспрессо
                onPressed: () {
                  coffeeMachine
                      .makingCoffee(espresso); //проверка + изготовление кофе
                  setState(() {
                    coff = coffeeMachine
                        .resources.coffeeBeans; //убавление ресурсов
                    mil = coffeeMachine.resources.milk;
                    wat = coffeeMachine.resources.water;
                    money = coffeeMachine.resources.cash;

                    mess;
                  });
                },
                child: Text('Эспрессо 70p')),
            ElevatedButton(
                //кнопка для приготовление копучино
                onPressed: () {
                  coffeeMachine
                      .makingCoffee(cappuccino); //проверка + изготовление кофе
                  setState(() {
                    coff = coffeeMachine
                        .resources.coffeeBeans; //убавление ресурсов
                    mil = coffeeMachine.resources.milk;
                    wat = coffeeMachine.resources.water;
                    money = coffeeMachine.resources.cash;
                    mess;
                  });
                },
                child: Text('Капучино 150p')),
            ElevatedButton(
                //кнопка для приготовления латте
                onPressed: () {
                  coffeeMachine
                      .makingCoffee(latte); //проверка + изготовление кофе
                  setState(() {
                    coff = coffeeMachine
                        .resources.coffeeBeans; //убавление ресурсов
                    mil = coffeeMachine.resources.milk;
                    wat = coffeeMachine.resources.water;
                    money = coffeeMachine.resources.cash;
                    mess;
                  });
                },
                child: Text('Латте 160p')),
            const Text(
              //пространство для разделения
              '',
            ),
            Text(
              //сообщение о приготовлении кофе

              '$mess',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        //добавление кофейных зерен
                        decoration:
                            const InputDecoration(labelText: 'Кофейные зерна '),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          //проверка ввода
                          if (value!.isEmpty) {
                            //если значение не задано

                            return 'Добавьте зерна'; //вывод сообщения на экран
                          }
                          try {
                            if (int.parse(value) > 0) {
                              setState(() {
                                amount_cof = int.parse(value);
                              }); //если значение больше нуля
                            } //передача значения переменной
                            else {
                              return 'Такого не бывает!'; //сообщение на экран
                            }
                          } catch (e) {
                            //нахождение ошибки

                            return e.toString();
                          }
                        }),
                    TextFormField(
                        //добавление молока
                        decoration: const InputDecoration(labelText: 'Молоко '),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          //проверка ввода
                          if (value!.isEmpty) {
                            //если значение не задано

                            return 'Добавьте молоко'; //вывод сообщения на экран
                          }
                          try {
                            if (int.parse(value) > 0) {
                              setState(() {
                                amount_milk = int.parse(value);
                              }); //если значение больше нуля
                            } //передача значения переменной
                            else {
                              return 'Такого не бывает!'; //сообщение на экран
                            }
                          } catch (e) {
                            //нахождение ошибки

                            return e.toString();
                          }
                        }),
                    TextFormField(
                        //добавление воды
                        decoration: const InputDecoration(labelText: 'Вода '),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          //проверка ввода
                          if (value!.isEmpty) {
                            //если значение не задано

                            return 'Добавьте воду'; //вывод сообщения на экран
                          }
                          try {
                            if (int.parse(value) > 0) {
                              setState(() {
                                amount_water = int.parse(value);
                              }); //если значение больше нуля
                            } //передача значения переменной
                            else {
                              return 'Такого не бывает!'; //сообщение на экран
                            }
                          } catch (e) {
                            //нахождение ошибки

                            return e.toString();
                          }
                        }),
                    ElevatedButton(
                        //кнопка для добавления ресурсов
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (amount_cof > 0 &&
                                amount_milk > 0 &&
                                amount_water > 0) {
                              //если в переменных есть числа
                              setState(() {
                                coffeeMachine.fillCoffeeBeans(
                                    amount_cof); //вызов сеттеров
                                coffeeMachine.fillMilk(amount_milk);
                                coffeeMachine.fillWater(amount_water);
                              });
                              coff = coffeeMachine.resources
                                  .coffeeBeans; //вывод на экран количества
                              mil = coffeeMachine.resources.milk;
                              wat = coffeeMachine.resources.water;
                              amount_cof = 0;
                              amount_milk = 0;
                              amount_water = 0;
                            }
                          }
                        },
                        child: const Text(
                          'Добавить',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
