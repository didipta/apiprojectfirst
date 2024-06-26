class Photos {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photos({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
      albumId: json["albumId"],
      id: json["id"],
      title: json["title"],
      url: json["url"],
      thumbnailUrl: json["thumbnailUrl"]
    );
  }

}