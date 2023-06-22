import 'package:surf_dart_courses_template/surf_dart_courses_template.dart'
    as surf_dart_courses_template;

num averageSumFromList(List<num> list) {
  return list.fold<num>(0, (a, b) => a + b) / list.length;
}

void main(List<String> arguments) {
  final currentDate = DateTime.now();

  final territories = List.from(surf_dart_courses_template.mapBefore2010.values)
    ..addAll(surf_dart_courses_template.mapAfter2010.values);

  final setOfMachineries =
      territories.expand((e) => e).expand((e) => e.machineries).toSet();

  // список возраста техники
  final agesOfMachinaries = setOfMachineries
      .map((machinery) => currentDate.year - machinery.releaseDate.year)
      .toList();

  // сортировка по убыванию
  agesOfMachinaries.sort((a, b) => b.compareTo(a));

  final middleIndex = (agesOfMachinaries.length / 2).ceil();
  final mapOfAverageAges = {
    'allMachineries': averageSumFromList(agesOfMachinaries),
    'oldMachineries':
        averageSumFromList(agesOfMachinaries.sublist(0, middleIndex)),
  };

  print('Средний возраст техники: ${mapOfAverageAges["allMachineries"]}');
  print(
      'Средний возраст 50% старой техники: ${mapOfAverageAges["oldMachineries"]}');
}
