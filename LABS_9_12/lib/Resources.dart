class Resources {
  //класс ресурсов

  int _coffeeBeans = 1500; //поля
  int _milk = 500;
  int _water = 500;
  int _cash = 0;

  Resources() {} //конструктор

  int get coffeeBeans {//геттеры
    return _coffeeBeans;
  }

  int get milk {
    return _milk;
  }

  int get water {
    return _water;
  }

  int get cash {
    return _cash;
  }

  set coffeeBeans(int amount) {//сеттеры
    _coffeeBeans = amount;
  }

  set milk(int amount) {
    _milk = amount;
  }

  set water(int amount) {
    _water = amount;
  }

  set cash(int amount) {
    _cash = amount;
  }
}
