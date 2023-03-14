import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
UrlLauncher.launch("tel://784")

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
  int _counter = 26; //создание счетчика
  var _color_button = Colors.grey[500];



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
                      if (_color_button == Colors.red[800]){
                        _counter --;
                        _color_button = Colors.grey[500];
                      } else{
                        _color_button = Colors.red[800];
                        _counter++;
                      }
                    })
                  },
                ),
                Text( //выводит значение инкремента
                  '$_counter',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => launch(),
                  child: child)
              //_buildButtonColumn(color, Icons.call, 'ПОЗВОНИТЬ'),
              _buildButtonColumn(color, Icons.near_me, 'МАРШРУТ'),
              _buildButtonColumn(color, Icons.share, 'ПОДЕЛИТЬСЯ'),
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
