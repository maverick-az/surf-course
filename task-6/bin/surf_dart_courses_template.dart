import 'package:surf_dart_courses_template/surf_dart_courses_template.dart'
    as surf_lib;

void main(List<String> arguments) {
  // Список товаров хранится в строковом виде
  final articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';

  // Получить список товаров
  final products = surf_lib.convertToList(
    articles,
    surf_lib.ProductListFromStringConverter(),
  );

  // Применить фильтр по категории
  final filteredProductsByCategory = surf_lib.applyFilter(
    products,
    surf_lib.FilterProductByCategory('молоко'),
  );
  // вывод данных
  surf_lib.printProductList(filteredProductsByCategory, '\nКатегория "молоко"');

  // Применить фильтр по цене
  final filteredProductsByPrice = surf_lib.applyFilter(
    products,
    surf_lib.FilterProductByPriceNotHigher(200),
  );
  // вывод данных
  surf_lib.printProductList(
      filteredProductsByPrice, '\nТовары с ценой не больше 200 рублей');

  // Применить фильтр по остатку на складе
  final filteredProductsByQuantity = surf_lib.applyFilter(
    products,
    surf_lib.FilterProductByQuantitySmaller(50),
  );
  // вывод данных
  surf_lib.printProductList(
      filteredProductsByQuantity, '\nТовары с остатком меньше 50 шт');
}
