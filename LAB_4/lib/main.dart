import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green, //цвет верхней панели зеленый
      ),
      home: const MyHomePage(title: 'Общежития КубГАУ'),
    ); //надпись на верхней панели
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
  //StatefulWidget предназначен
  //для отображения изменяющихся состояний
  //виджета без видимой «перезагрузки» интерфейса.
  int _counter = 26; //создание счетчика для лайков
  var _color_button = Colors.grey[500]; //переменная для цвета кнопки лайка
  String url = '89676656512'; //пременная с номером телефона

  _makingPhoneCall() {
    //функция для нажатия на кнопку "позвонить"
    try {
      //попытка выполнить команду
      launch('tel:$url'); //запуск приложения для набора номера
    } catch (e) {
      //вызов исключения
      throw 'Could not launch $url'; //создание исключения
    }
  }

  void _shareContent() {
    //фукция поделиться
    Share.share(
        'Общежитие №20. Краснодар, ул. Калинина, 13. Телефон: $url'); //то чем будем делиться
  }

  @override
  Widget build(BuildContext context) {
    //отстраивание экрана (интерфейс)
    //Color color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        //верхняя строка с заголовком
        title: Text(widget.title),
      ),
      body: ListView(
        //прокручиваемый список виджетов
        children: [
          //дочерние элементы (body)
          Image.asset('assets/images/campus.jpg'), //картинка в верху экрана
          Container(
            //виджет для изменения размеров, расстояний и т.д.
            padding: const EdgeInsets.all(32), //расстояние текста от границ
            child: Row(
              //дочерние элементы будут идти в строку
              children: [
                Expanded(
                  //расширение дочернего элемента для заполнения пространства экрана
                  child: Column(
                    //дочерние элементы будут идти в колонку
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //дочерние элементы должны быть размещены вдоль поперечной оси
                    //начальный край выровнен с начальной стороной поперечной оси
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        //для добавления расстояния между тектсом
                        child: const Text(
                          //текст на экране
                          'Общежитие №20',
                          style: TextStyle(
                            //придение текту стиля
                            fontWeight:
                                FontWeight.bold, //выделение текста жирным
                          ),
                        ),
                      ),
                      Text(
                        'Краснодар, ул. Калинина, 13',
                        style: TextStyle(
                          color: Colors.grey[500], //покраска текста в серый
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  //создание кнопки лайка
                  icon: Icon(
                    //икока кнопки
                    Icons.favorite, //значок сердечка
                    color: _color_button, //покрас значка через переменную
                  ),
                  onPressed: () => {
                    //что будет происходить при нажатии
                    setState(() {
                      //метод для фиксирования изменений (цвет)
                      if (_color_button == Colors.red[800]) {
                        //если кнопка красная
                        _counter--; //уменьшаем счетчик и красим кнопку в серый
                        _color_button = Colors.grey[500];
                      } else {
                        // иначе
                        _color_button = Colors
                            .red[800]; // красим в красный и увеличиваем счетчик
                        _counter++;
                      }
                    })
                  },
                ),
                Text(
                  //выводит значение счетчика лайков
                  '$_counter',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Row(
            //элементы будут идти в строку
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //элементы должны быть размещены вдоль главной оси равномерно
            children: [
              TextButton.icon(
                //создание кнопки позвонить
                onPressed: _makingPhoneCall, //обращение к функции
                icon: Column(
                  //элементы иконки идут в столбик
                  children: [
                    Icon(
                      Icons.call, //значок трубка телефона
                      size: 30, //размер значка
                    ),
                    const Divider(
                      height: 10,
                    ),
                    //расстояние между текстом и значком
                    Text('ПОЗВОНИТЬ'),
                  ],
                ),
                label: Text(''),
              ),
              TextButton.icon(
                //создание кнопки машрут
                onPressed: () {
                  launch(//открытие карт и ссылка на маршут
                      'https://www.google.com/maps/dir//%D0%9E%D0%B1%D1%89%D0%B5%D0%B6%D0%B8%D1%82%D0%B8%D0%B5+20,+%D0%A3%D0%BB%D0%B8%D1%86%D0%B0+%D0%9A%D0%B0%D0%BB%D0%B8%D0%BD%D0%B8%D0%BD%D0%B0+13,+%D0%BA%D0%BE%D1%80%D0%BF%D1%83%D1%81+20,+%D1%83%D0%BB.+%D0%9A%D0%B0%D0%BB%D0%B8%D0%BD%D0%B8%D0%BD%D0%B0+13,+13%D0%BA20,+%D0%9A%D1%80%D0%B0%D1%81%D0%BD%D0%BE%D0%B4%D0%B0%D1%80,+%D0%9A%D1%80%D0%B0%D1%81%D0%BD%D0%BE%D0%B4%D0%B0%D1%80%D1%81%D0%BA%D0%B8%D0%B9+%D0%BA%D1%80%D0%B0%D0%B9,+350044/@45.050583,38.9197903,17z/data=!3m1!4b1!4m17!1m7!3m6!1s0x40f04f3737bffbff:0x384537772b6bf12d!2z0J7QsdGJ0LXQttC40YLQuNC1IDIw!8m2!3d45.0502933!4d38.9207626!16s%2Fg%2F11bwqqb83z!4m8!1m1!4e1!1m5!1m1!1s0x40f04f3737bffbff:0x384537772b6bf12d!2m2!1d38.9208175!2d45.0502591');
                },
                icon: Column(
                  //элементы иконки идут в столбик
                  children: [
                    Icon(
                      Icons.near_me, //иконка новигатор
                      size: 30, //размер иконки
                    ),
                    const Divider(
                      height: 10,
                    ),
                    //расстояние между текстом и значком
                    Text('МАРШРУТ'),
                  ],
                ),
                label: Text(''),
              ),
              TextButton.icon(
                onPressed: _shareContent, //вызов функции поделиться
                icon: Column(
                  //элементы иконки идут в столбик
                  children: [
                    Icon(
                      Icons.share, //иконка поделится
                      size: 30, //размер иконки
                    ),
                    const Divider(
                      height: 10,
                    ),
                    //расстояние между текстом и значком
                    Text('ПОДЕЛИТЬСЯ'),
                  ],
                ),
                label: Text(''),
              ),
            ],
          ),
          const Padding(
            //блок большого текста
            padding: EdgeInsets.all(32), //расстояние от текста до границ экрана
            child: Text(
              //вывод текста на экран
              'Студенческое общежите - это общежитие, которое предназначено '
              'для проживания студентов, на территории университета или рядом с ним.'
              'Одним из главных преимуществ студенческого общежития является то,'
              'что оно предоставляет студентам возможность жить близко к университету,'
              'что может значительно упростить им жизнь и эконосить время и деньги '
              'на дорогу. Кроме того проживание в общежитии может помочь студентам '
              'интегрироваться в университетскую жизнь и быстрее находить новых друзей '
              'и знакомых. Однако, студенческое общежитие также имеет свои недостатки. '
              'Одним из них может быть ограниченное пространство и недостаток личной жизни. '
              'Студенты могут испытывать некоторые неудобства, такие как шум и отсутствие личного пространства, '
              'когда они проживают с другими людьми в одной комнате или на одном этаже. '
              'Кроме того, некоторые студенты могут предпочитать проживание вне общежития, '
              'чтобы иметь больше свободы и контроля над своей жизнью.',
            ),
          ),
        ],
      ),
    );
  }
}
