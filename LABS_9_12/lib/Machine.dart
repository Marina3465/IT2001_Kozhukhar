import 'package:labs_9_12/Coffee.dart';
import 'Resources.dart';

String mess = 'Выберите напиток';

class Machine { //класс кофемашина
  Resources _resources = Resources(); //экземпляр класса

  Machine() {} //конструктор класса

  Resources get resources{
    return _resources;
  }

  set resources (Resources resources){
    _resources = resources;
  }

  void fillCoffeeBeans(int amount) { //функции добавления ресурсов
    resources.coffeeBeans += amount;
  }

  void fillMilk(int amount) {
    resources.milk += amount;
  }

  void fillWater(int amount) {
    resources.water += amount;
  }

  void fillCash(int amount){
    resources.cash += amount;
  }

  void subtractResourcesForCoffee(Coffee coffee){
    resources.coffeeBeans -= coffee.coffeeBeans;
    resources.milk -= coffee.milk;
    resources.water -= coffee.water;
    resources.cash += coffee.cash;
  }

  bool isAvailableForCoffee(Coffee coffee){
    return(resources.coffeeBeans >= coffee.coffeeBeans &&
    resources.milk >= coffee.milk &&
    resources.water >= coffee.water);
  }

  void makingCoffee(Coffee coffee) { //функция приготовления напитка
        if (isAvailableForCoffee(coffee)) {
          subtractResourcesForCoffee(coffee);
          mess = 'Ваш кофе готов!';
        } else {
          mess = 'Недостаточно ресурсов, чтобы приготовить кофе :(';
        }
  }
}
