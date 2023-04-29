import 'package:flutter/material.dart';
import 'Machine.dart'; //ссылка на файл с классом

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _formKey = GlobalKey<FormState>();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  _MyHomePageState() {
    coff = coffeeMachine.coffeeBeans; //назначение переменным гет
    mil = coffeeMachine.milk;
    wat = coffeeMachine.water;
    money = coffeeMachine.cash;
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
  Widget build(BuildContext context) { //построение экрана
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( //вывод на экран того, что осталось из ресурсов
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
            ElevatedButton( //кнопка для приготовления эспрессо
                onPressed: () {
                  coffeeMachine.makingCoffee('espresso');
                  setState(() {
                    if (coffeeMachine.isAvailableForEspresso())
                      coffeeMachine.fillCash(70);
                    coff = coffeeMachine.coffeeBeans;
                    mil = coffeeMachine.milk;
                    wat = coffeeMachine.water;
                    money = coffeeMachine.cash;

                    mess;
                  });
                },
                child: Text('Эспрессо 70p')),
            ElevatedButton( //кнопка для приготовление копучино
                onPressed: () {
                  coffeeMachine.makingCoffee('cappuccino');
                  setState(() {
                    if (coffeeMachine.isAvailableForCappuccino())
                      coffeeMachine.fillCash(150);
                    coff = coffeeMachine.coffeeBeans;
                    mil = coffeeMachine.milk;
                    wat = coffeeMachine.water;
                    money = coffeeMachine.cash;
                    mess;
                  });
                },
                child: Text('Капучино 150p')),
            ElevatedButton( //кнопка для приготовления латте
                onPressed: () {
                  coffeeMachine.makingCoffee('latte');
                  setState(() {
                    if (coffeeMachine.isAvailableForLatte())
                      coffeeMachine.fillCash(160);
                    coff = coffeeMachine.coffeeBeans;
                    mil = coffeeMachine.milk;
                    wat = coffeeMachine.water;
                    money = coffeeMachine.cash;
                    mess;
                  });
                },
                child: Text('Латте 160p')),
            const Text( //простринство для разделения
              '',
            ),
            Text( //сообщение о приготовлении кофе
              '$mess',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Form(
              key: _formKey,
                child: Column(
                  children: [
                    TextFormField( //добавление кофейных зерен
                        decoration: const InputDecoration(labelText: 'Кофейные зерна '),
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
                    TextFormField( //добавление молока
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
                    TextFormField( //добавление воды
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
                    ElevatedButton( //кнопка для добавления ресурсов
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (amount_cof > 0 &&
                                amount_milk > 0 &&
                                amount_water > 0) {
                              //если в переменных есть числа
                              setState(() {
                                coffeeMachine.fillCoffeeBeans(amount_cof); //вызов сеттеров
                                coffeeMachine.fillMilk(amount_milk);
                                coffeeMachine.fillWater(amount_water);
                              });
                              coff = coffeeMachine.coffeeBeans; //вывод на экран количества
                              mil = coffeeMachine.milk;
                              wat = coffeeMachine.water;
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
                )
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
