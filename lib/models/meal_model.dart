class MealModel {
  final int id;
  final String name;
  final String category;
  final int calories;
  final int protein;
  final int carbs;
  final int fats;
  final double price;
  final String imageUrl;

  MealModel(
      {required this.id,
      required this.name,
      required this.category,
      required this.calories,
      required this.protein,
      required this.carbs,
      required this.fats,
      required this.price,
      required this.imageUrl});

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
        id: json['id'],
        name: json['name'],
        category: json['category'],
        calories: json['calories'],
        protein: json['protein'],
        carbs: json['carbs'],
        fats: json['fats'],
        price: json['price'],
        imageUrl: json['image']);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "category": category,
      "calories": calories,
      "protein": protein,
      "carbs": carbs,
      "fats": fats,
      'price': price,
      "image": imageUrl
    };
  }
}


/*
    {
      "id": 1,
      "name": "Grilled Chicken Salad",
      "category": "Healthy",
      "calories": 350,
      "protein": 30,
      "carbs": 10,
      "fats": 15,
      "image": "https://example.com/images/grilled_chicken_salad.jpg"
    },
 */