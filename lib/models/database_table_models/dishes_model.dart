class DishesModel {
  final int id;
  final String name;
  final String description;
  final String structure;
  final String cookingMethod;
  final String kilocalories;
  final String image;
  bool isFavorite = false;

  DishesModel(this.id, this.name, this.description, this.structure,
      this.cookingMethod, this.kilocalories, this.image);

  DishesModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        description = res["description"],
        structure = res["structure"],
        cookingMethod = res["cooking_method"],
        kilocalories = res["kilocalories"],
  image = res["image"];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'structure': structure,
      'cooking_method': cookingMethod,
      'kilocalories': kilocalories,
      'image': image
    };
  }
}

