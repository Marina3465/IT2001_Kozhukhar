import 'package:labs_9_12/Coffee.dart';
import 'Resources.dart';
import 'Async.dart';

String mess = 'Выберите напиток';

class Machine {
  //класс кофемашина
  Resources _resources = Resources(); //экземпляр класса

  Machine() {} //конструктор класса

  Resources get resources {
    return _resources;
  }

  set resources(Resources resources) {
    _resources = resources;
  }

  void fillCoffeeBeans(int amount) {
    //функции добавления ресурсов
    resources.coffeeBeans += amount;
  }

  void fillMilk(int amount) {
    resources.milk += amount;
  }

  void fillWater(int amount) {
    resources.water += amount;
  }

  void fillCash(int amount) {
    resources.cash += amount;
  }

  void subtractResourcesForCoffee(Coffee coffee) {
    resources.coffeeBeans -= coffee.coffeeBeans;
    resources.milk -= coffee.milk;
    resources.water -= coffee.water;
    resources.cash += coffee.cash;
  }

  bool isAvailableForCoffee(Coffee coffee) {
    return (resources.coffeeBeans >= coffee.coffeeBeans &&
        resources.milk >= coffee.milk &&
        resources.water >= coffee.water);
  }

  Future<void> makingCoffee(Coffee coffee) async {
    //функция приготовления напитка
    if (isAvailableForCoffee(coffee)) {
      //проверка ресурсов
      await water_heating(); //функция подогрева воды
      if (coffee.milk > 0) //проверка молока в рецепте
      {
        await Future.wait([
          brewing_coffee(),
          whipping_milk()
        ]); //заваривание кофе и взбитие молока
        await mix_coff_and_milk(); //смешивание молока и воды
      } else
        await brewing_coffee(); //если кофе без молока, заваривание кофе

      subtractResourcesForCoffee(coffee); //отнять ресурсы

      mess = 'Ваш кофе готов!'; //вывод сообщений о кофе
    } else {
      mess = 'Недостаточно ресурсов, чтобы приготовить кофе :(';
    }
  }
}
