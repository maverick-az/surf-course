/// Класс для описании товара
class Product {
  final int id;
  final String category;
  final String name;
  final double price;

  /// Остаток на складе
  final double quantity;

  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

/// Интерфейс для приминения фильтра
abstract interface class Filter<T> {
  bool apply(T value);
}

/// Интерфейс для реализации фильтрации по категории
class FilterProductByCategory implements Filter<Product> {
  final String category;

  FilterProductByCategory(this.category);

  @override
  bool apply(Product product) {
    return product.category.trim() == category.trim();
  }
}

/// Интерфейс для реализации фильтрации товаров с ценой не больше [price]
class FilterProductByPriceNotHigher implements Filter<Product> {
  final double price;

  FilterProductByPriceNotHigher(this.price);

  @override
  bool apply(Product product) {
    return product.price <= price;
  }
}

/// Интерфейс для реализации фильтрации товаров с остатком меньше [quantity]
class FilterProductByQuantitySmaller implements Filter<Product> {
  final double quantity;

  FilterProductByQuantitySmaller(this.quantity);

  @override
  bool apply(Product product) {
    return product.quantity < quantity;
  }
}

/// Реализация фильтрации в список [products]
/// в зависимости от фильтра [filter]
List<Product> applyFilter(List<Product> products, Filter<Product> filter) {
  return products.where(filter.apply).toList();
}

/// Интерфейс для реализации конвертации данных в список данных
abstract interface class IListDataConverter<T extends Object, V> {
  List<T> convertToListData(V data);
}

/// Класс для описании конвертации данных из строки в список товаров
///
/// Пример данных строки:
///
/// ```txt
/// 1,хлеб,Бородинский,500,5
/// 2,хлеб,Белый,200,15
/// 3,молоко,Полосатый кот,50,53
/// ```
class ProductListFromStringConverter
    implements IListDataConverter<Product, String> {
  const ProductListFromStringConverter();

  @override
  List<Product> convertToListData(String data) {
    // Получить список товаров
    var products = data
        .split('\n')
        .where((element) => element.trim().isNotEmpty)
        .map((element) {
      // получить данные полей из текущей строки
      final rowData = element.split(',');

      return Product(
        id: int.parse(rowData[0]),
        category: rowData[1],
        name: rowData[2],
        price: double.parse(rowData[3]),
        quantity: double.parse(rowData[4]),
      );
    }).toList();

    return products;
  }
}

/// Функция для конвертации данных в список
List<T> convertToList<T extends Object, V>(
    V data, IListDataConverter<T, V> converter) {
  return converter.convertToListData(data);
}

/// Функция для вывода данных списка товаров в консоль
///
/// [messageInfo] - информативная сообщение. Выводится в случае если заполнено
void printProductList(List<Product> products, [String messageInfo = '']) {
  if (messageInfo.isNotEmpty) {
    print(messageInfo);
  }

  for (int i = 0; i < products.length; i++) {
    final product = products[i];
    print(
        '${product.id}  ${product.category} ${product.name} ${product.price} рублей ${product.quantity} шт');
  }
}
