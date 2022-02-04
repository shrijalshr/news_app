class NewsModel {
  NewsModel({
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
  int? categoryId;
  String? title;
  String? content;
  String? image;
  dynamic link;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? count;
  int? type;
  String? username;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
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
