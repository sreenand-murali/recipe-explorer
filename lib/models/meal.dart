class Meal {
  Meal(
      {required this.glutenFree,
      required this.vegan,
      required this.title,
      required this.imageUrl,
      required this.categoryId,
      this.description});


      final String title;
      final String imageUrl;
      final String categoryId;
      final String? description;
      final bool glutenFree;
      final bool vegan;

}
