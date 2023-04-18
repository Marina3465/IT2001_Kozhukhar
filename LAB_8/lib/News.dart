import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //подключение доп библиотек для запросов
import 'package:intl/intl.dart';

Future<List<News>> fetchNews(http.Client client) async { //запрос к API, чтобы вернуть JSON
  final response = await client.get(Uri.parse(
      'https://kubsau.ru/api/getNews.php?key=6df2f5d38d4e16b5a923a6d4873e2ee295d0ac90'));
  return compute(parseNews, response.body);
}

List<News> parseNews(String responseBody) { //функция для конвертации json в объект news
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<News>((json) => News.fromJson(json)).toList();
}

class News { //класс, в котором указаны данные для новостей
  final String ACTIVE_FROM;
  final String TITLE;
  final String PREVIEW_TEXT;
  final String PREVIEW_PICTURE_SRC;

  const News({
    required this.ACTIVE_FROM,
    required this.TITLE,
    required this.PREVIEW_TEXT,
    required this.PREVIEW_PICTURE_SRC,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      ACTIVE_FROM: json['ACTIVE_FROM'] as String,
      TITLE: json['TITLE'] as String,
      PREVIEW_TEXT: json['PREVIEW_TEXT'] as String,
      PREVIEW_PICTURE_SRC: json['PREVIEW_PICTURE_SRC'] as String,
    );
  }
}

class MyNews extends StatelessWidget { //отображение дочернего экрана
  const MyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Лента новостей КубГАУ'; //надпись на дочернем экране
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        //тема приложения
        primarySwatch: Colors.green,
      ),
      home: MyHomePageNews(title: appTitle),
    );
  }
}

class MyHomePageNews extends StatelessWidget { //статичный виджет MyHomePageNews, который отвечает за обработку запроса и вывод NewsList
  const MyHomePageNews({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: FutureBuilder<List<News>>(
          future: fetchNews(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Ошибка запроса!'),
              );
            } else if (snapshot.hasData) {
              return NewsList(news: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton( //кнопка для перехода на окно фотоальбома
            child: Icon(Icons.photo_album),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pop(context); //возвращение на главное окно
            }));
  }
}

class NewsList extends StatelessWidget { //виджет для вывода новостей кубгау
  const NewsList({Key? key, required this.news}) : super(key: key);
  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, //по одной новости в колонку
      ),
      itemCount: news.length,
      itemBuilder: (context, index) {
        return SizedBox( //отображение новостей в виде карточек, задание отступов и
          // расположение текста
          width: double.infinity,
          child: Card(
              child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(news[index].PREVIEW_PICTURE_SRC),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                news[index].ACTIVE_FROM,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            )),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                news[index].TITLE,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              Text(Bidi.stripHtmlIfNeeded(
                                  news[index].PREVIEW_TEXT)),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          )),
        );
      },
    );
  }
}
