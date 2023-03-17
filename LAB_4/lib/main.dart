import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 26; //создание счетчика для лайков
  var _color_button = Colors.grey[500]; //переменная для цвета кнопки лайка
  String url = '89676656512'; //пременная с номером телефона

  _makingPhoneCall() async {  //функция для нажатия на кнопку "позвонить"
    try { //попытка выполнить команду
      await launch('tel:$url'); //запуск приложения для набора номера
    } catch (e) { //исключение
      throw 'Could not launch $url'; //вызов исключения
    }
  }

  void _shareContent() {
    Share.share('Общежитие №20. Краснодар, ул. Калинина, 13. Телефон: $url');
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Image.asset('assets/images/campus.jpg'),
          Container(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: const Text(
                          'Общежитие №20',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Краснодар, ул. Калинина, 13',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: _color_button,
                  ),
                  onPressed: () => {
                    setState(() {
                      if (_color_button == Colors.red[800]) {
                        _counter--;
                        _color_button = Colors.grey[500];
                      } else {
                        _color_button = Colors.red[800];
                        _counter++;
                      }
                    })
                  },
                ),
                Text(
                  //выводит значение инкремента
                  '$_counter',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: _makingPhoneCall,
                icon: Column(
                  children: [
                    Icon(
                      Icons.call,
                      size: 30,
                    ),
                    Text('ПОЗВОНИТЬ'),
                  ],
                ),
                label: Text(''),
              ),
              TextButton.icon(
                onPressed: () {
                  launch(
                      'https://www.google.com/maps/dir//%D0%9E%D0%B1%D1%89%D0%B5%D0%B6%D0%B8%D1%82%D0%B8%D0%B5+20,+%D0%A3%D0%BB%D0%B8%D1%86%D0%B0+%D0%9A%D0%B0%D0%BB%D0%B8%D0%BD%D0%B8%D0%BD%D0%B0+13,+%D0%BA%D0%BE%D1%80%D0%BF%D1%83%D1%81+20,+%D1%83%D0%BB.+%D0%9A%D0%B0%D0%BB%D0%B8%D0%BD%D0%B8%D0%BD%D0%B0+13,+13%D0%BA20,+%D0%9A%D1%80%D0%B0%D1%81%D0%BD%D0%BE%D0%B4%D0%B0%D1%80,+%D0%9A%D1%80%D0%B0%D1%81%D0%BD%D0%BE%D0%B4%D0%B0%D1%80%D1%81%D0%BA%D0%B8%D0%B9+%D0%BA%D1%80%D0%B0%D0%B9,+350044/@45.050583,38.9197903,17z/data=!3m1!4b1!4m17!1m7!3m6!1s0x40f04f3737bffbff:0x384537772b6bf12d!2z0J7QsdGJ0LXQttC40YLQuNC1IDIw!8m2!3d45.0502933!4d38.9207626!16s%2Fg%2F11bwqqb83z!4m8!1m1!4e1!1m5!1m1!1s0x40f04f3737bffbff:0x384537772b6bf12d!2m2!1d38.9208175!2d45.0502591');
                },
                icon: Column(
                  children: [
                    Icon(
                      Icons.near_me,
                      size: 30,
                    ),
                    Text('МАРШРУТ'),
                  ],
                ),
                label: Text(''),
              ),
              TextButton.icon(
                onPressed: _shareContent,
                icon: Column(
                  children: [
                    Icon(
                      Icons.share,
                      size: 30,
                    ),
                    Text('ПОДЕЛИТЬСЯ'),
                  ],
                ),
                label: Text(''),
              ),

              //_buildButtonColumn(color, Icons.call, 'ПОЗВОНИТЬ'),
              //_buildButtonColumn(color, Icons.near_me, 'МАРШРУТ')

              //buildButtonColumn(color, Icons.share, 'ПОДЕЛИТЬСЯ'),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(32),
            child: Text(
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

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
