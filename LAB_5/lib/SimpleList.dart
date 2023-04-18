import 'package:flutter/material.dart';//связь с главным окном

class Simple extends StatelessWidget {//отстраивание экрана (интерфейс)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список элементов',//заголовок окна
      theme: ThemeData(//тема приложения
        primarySwatch: Colors.green,//цвет панели сверху
      ),
      home: Scaffold(
          appBar: AppBar(//верхняя строка с заголовком
            title: const Text('Список элементов'),//текст заголовка
          ),
          body: ListView(//создание списка
            children: const [
              Text('0000'),//текст элемента списка
              Divider(),//разделтель
              Text('0001'),
              Divider(),
              Text('0010'),
            ],
          )),
    );
  }
}
