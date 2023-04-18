import 'package:flutter/material.dart';

void main() {
  //запуск приложения
  runApp(MaterialApp(
    home: MainScreen(),
  ));
}

class MainScreen extends StatelessWidget {
  //главный экран
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Возвращение значения')),
      //надпись вверху экрана
      body: Center(
          //элементы расположены по центру
          child: ElevatedButton(
              //кнопка перехода на второй экран
              onPressed: () {
                Navigator.push(
                    context, //добавление нового маршрута в стек
                    MaterialPageRoute(
                        builder: (context) =>
                            SecondScreen())); //позволяет открыть полноэкранное окно с эффектом присущим для вашей мобильной системы
              },
              child: Text('Приступить к выбору...') //название кнопки
              )
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  //второй экран
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Выберите любой вариант')),
      //надпись вверху экрана
      body: Center(
          //элементы расположены по центру (горизонтально)
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //элементы расположены по центру (вертикально)
            children: [
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    //вызов всплывающего сообщения
                    const SnackBar(
                      content: Text('Да!'), //текст сообщения
                      backgroundColor: Colors.black, //цвет фона сообщения
                    ),
                  );
                  Navigator.pop(
                      context); //возврат к предыдущему экрану (на главный)
                },
                child: Text('Да!')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    //вызов всплывающего сообщения
                    const SnackBar(
                      content: Text('Нет.'), //текст сообщения
                      backgroundColor: Colors.black, //цвет фона сообщения
                    ),
                  );
                  Navigator.pop(
                      context); //возврат к предыдущему экрану (на главный)
                },
                child: Text('Нет.'))
          ],
        )
      ),
    );
  }
}
