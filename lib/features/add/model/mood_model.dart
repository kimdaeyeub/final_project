class Mood {
  final String text;
  final String icon;
  final String creatorUid;
  final int createdAt;

  Mood({
    required this.text,
    required this.icon,
    required this.creatorUid,
    required this.createdAt,
  });

  Mood.fromJson(Map<String, dynamic> json)
      : text = json["text"],
        icon = json["icon"],
        creatorUid = json["creatorUid"],
        createdAt = json["createAt"];

  Map<String, dynamic> toJson() {
    return {
      "text": text,
      "icon": icon,
      "creatorUid": creatorUid,
      "createdAt": createdAt
    };
  }
}
