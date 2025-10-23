enum CategoryType { fixed, variable }

class ExpenseCategory {
  final String id;
  final String name;
  final CategoryType type;
  final String icon;
  final String color;

  ExpenseCategory({
    required this.id, required this.name,
    required this.type, required this.icon, required this.color,
  });
}