import 'package:flutter/material.dart';
import 'package:lab_5/InfinityList.dart'; //включение дополнительного файла
import 'package:lab_5/InfinityMathList.dart'; //включение дополнительного файла
import 'package:lab_5/SimpleList.dart'; //включение дополнительного файла

void main() {
  runApp(const MyApp()); //запуск окна MyApp
}

class MyApp extends StatelessWidget {
  //корневой элемент
//StatelessWidget предназначен для отображения статичных виджетов,
// которые не изменяются во время исполнения приложения.
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список элементов', //заголовок окна
      theme: ThemeData(
        //тема приложения
        primarySwatch: Colors.green, //цвет панели сверху
      ),
      home: const MyHomePage(
          title: 'Список элементов'), //домашний класс приложения
    );
  }
}

class MyHomePage extends StatefulWidget {
  //StatefulWidget предназначен
  //для отображения изменяющихся состояний
  //виджета без видимой «перезагрузки» интерфейса.
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(); //State - отслеживание
// изменений в _MyHomePageState()
}

class _MyHomePageState extends State<MyHomePage> {
  //отстраивание экрана (интерфейс)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //верхняя строка с заголовком
          title: Text(widget.title),
        ),
        body: Center(
          //в основной части элементы будут расположены по центру
          child: Column(
            //элементы идут по очереди в колонке
            mainAxisAlignment: MainAxisAlignment.center,
            //выравние элементов колонки по центру
            children: [
              ElevatedButton(
                //кнопка для перехода на простой список
                child: Text('Простой список'), //текст кнопки
                onPressed: () {
                  Navigator.push(
                    //переход в другое окно
                    context,
                    MaterialPageRoute(
                        builder: (context) => Simple()), //ссылка на окно
                  );
                },
              ),
              ElevatedButton(
                //кнопка для перехода на бесконечный список
                child: Text('Бесконечный список'), //текст кнопки
                onPressed: () {
                  Navigator.push(
                    //переход в другое окно
                    context,
                    MaterialPageRoute(
                        builder: (context) => Infinity()), //ссылка на окно
                  );
                },
              ),
              ElevatedButton(
                //кнопка для перехода на бесконечный список с возведением в степень
                child: Text('Бесконечный список возведения в степень 2'),
                //текст кнопки
                onPressed: () {
                  Navigator.push(
                    //переход в другое окно
                    context,
                    MaterialPageRoute(
                        builder: (context) => InfMain()), //ссылка на окно
                  );
                },
              ),
            ],
          ),
        ));
  }
}
