class Temperatures {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Temperatures({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Temperatures.fromJson(Map<String, dynamic> json) {
    return Temperatures(
      albumId: json["albumId"],
      id: json["id"],
      title: json["title"],
      url: json["url"],
      thumbnailUrl: json["thumbnailUrl"]
    );
  }

}