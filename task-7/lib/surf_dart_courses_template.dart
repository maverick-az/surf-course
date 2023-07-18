/// Тип данных для каталога товаров в форме словаря
typedef RawProductCatalog = Map<String, Map<String, List<RawProductItem>>>;

/// Класс для описание товара
class RawProductItem {
  final String name;
  final String categoryName;
  final String subcategoryName;
  final DateTime expirationDate;
  final int qty;

  RawProductItem({
    required this.name,
    required this.categoryName,
    required this.subcategoryName,
    required this.expirationDate,
    required this.qty,
  });

  @override
  String toString() {
    return name;
  }
}
