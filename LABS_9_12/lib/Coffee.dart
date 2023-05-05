abstract class ICoffee {
  //интерфейс
  int get coffeeBeans;

  int get milk;

  int get water;

  int get cash;

  set coffeeBeans(int amount);

  set milk(int amount);

  set water(int amount);

  set cash(int amount);
}

class Coffee extends ICoffee {
  //класс для кофе

  int _coffeeBeans = 20; //поля
  int _milk = 0;
  int _water = 50;
  int _cash = 0;

  Coffee(int coffeeBeans, int milk, int water, int cash) {
    //конструктор
    this.coffeeBeans = coffeeBeans;
    this.milk = milk;
    this.water = water;
    this.cash = cash;
  }

  int get coffeeBeans {
    //геттеры
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

  set coffeeBeans(int amount) {
    //сеттеры
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
