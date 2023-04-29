String mess = 'Выберите напиток';

class Machine { //класс кофемашина
  int _coffeeBeans = 1500;
  int _milk = 500;
  int _water = 500;
  int _cash = 0;

  Machine() {} //конструктор класса

  int get coffeeBeans { //геттеры
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

  set coffeeBeans(int amount) { //сеттеры
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

  void fillCoffeeBeans(int amount) { //функции добавления ресурсов
    _coffeeBeans += amount;
  }

  void fillMilk(int amount) {
    _milk += amount;
  }

  void fillWater(int amount) {
    _water += amount;
  }

  void fillCash(int amount){
    _cash += amount;
  }

  void subtractResourcesForEspresso() { //приготовление кофе и отнимание ресурсов
    _coffeeBeans -= 50;
    _water -= 100;
  }

  void subtractResourcesForCappuccino() {
    _coffeeBeans -= 60;
    _water -= 120;
    _milk -= 60;
  }

  void subtractResourcesForLatte() {
    _coffeeBeans -= 36;
    _water -= 72;
    _milk -= 108;
  }

  bool isAvailableForEspresso() { //проверка на наличие ресурсов
    return _coffeeBeans >= 50 && _water >= 100;
  }

  bool isAvailableForCappuccino() {
    return _coffeeBeans >= 60 && _water >= 120 && _milk >= 60;
  }

  bool isAvailableForLatte() {
    return _coffeeBeans >= 36 && _water >= 72 && _milk >= 108;
  }

  void makingCoffee(String coffeeType) { //функция приготовления напитка
    switch (coffeeType) { //переключатель
      case 'espresso':
        if (isAvailableForEspresso()) {
          subtractResourcesForEspresso();
          mess = 'Ваш эспрессо готов!';
        } else {
          mess = 'Недостаточно ресурсов, чтобы приготовить кофе :(';
        }
        break;
      case 'cappuccino':
        if (isAvailableForCappuccino()) {
          subtractResourcesForCappuccino();
          mess = 'Ваш капучино готов!';
        } else {
          mess = 'Недостаточно ресурсов, чтобы приготовить кофе :(';
        }
        break;
      case 'latte':
        if (isAvailableForLatte()) {
          subtractResourcesForLatte();
          mess = 'Ваш латте готов!';
        } else {
          mess = 'Недостаточно ресурсов, чтобы приготовить кофе :(';
        }
        break;
    }
  }
}
