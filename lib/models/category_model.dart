class CategoryModel {
  CategoryModel({
    this.id,
    this.category,
  });

  String? id;
  String? category;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        category: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": category,
      };
}
