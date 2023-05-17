Future<void> water_heating(){ //асинхронная функция нагрева воды
  print('Start: нагревание воды'); //вывод в консоль
  return Future.delayed(const Duration(seconds: 3), () { //задержка 3 сек
    print('End: нагревание воды'); //вывод в консоль
  });
}

Future<void> brewing_coffee(){ //асинхронная функция заваривания кофе
  print('Start: процесс заваривания кофе'); //вывод в консоль
  return Future.delayed(const Duration(seconds: 5), () { //задержка 5 сек
    print('End: процесс заваривания кофе'); //вывод в консоль
  });
}

Future<void> whipping_milk(){ //асинхронная функция взбития молока
  print('Start: процесс взбития молока'); //вывод в консоль
  return Future.delayed(const Duration(seconds: 5), () { //задержка 5 сек
    print('End: процесс взбития молока'); //вывод в консоль
  });
}

Future<void> mix_coff_and_milk(){ //асинхронная функция смешивания воды и молока
  print('Start: смешивание воды и молока'); //вывод в консоль
  return Future.delayed(const Duration(seconds: 3), () { //задержка 3 сек
    print('End: процесс смешивание воды и молока'); //вывод в консоль
  });
}
