class NewsArticleModel {
  NewsArticleModel({
    this.id,
    this.categoryId,
    this.title,
    this.content,
    this.link,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.count,
    this.type,
    this.username,
  });

  int? id;
  String? categoryId;
  String? title;
  String? content;
  dynamic link;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? count;
  String? type;
  String? username;

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) =>
      NewsArticleModel(
        id: json["id"],
        categoryId: json["category_id"],
        title: json["title"],
        content: json["content"],
        link: json["link"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        count: json["count"],
        type: json["type"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "title": title,
        "content": content,
        "link": link,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "count": count,
        "type": type,
        "username": username,
      };
}
