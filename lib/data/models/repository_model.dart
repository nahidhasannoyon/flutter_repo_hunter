import 'dart:convert';

RepositoryModel repositoryModelFromJson(String str) =>
    RepositoryModel.fromJson(json.decode(str));

String repositoryModelToJson(RepositoryModel data) =>
    json.encode(data.toJson());

class RepositoryModel {
  String? name;
  bool? private;
  String? description;
  DateTime? updatedAt;
  Owner? owner;
  int? stars;

  RepositoryModel({
    this.name,
    this.private,
    this.description,
    this.updatedAt,
    this.owner,
    this.stars,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      RepositoryModel(
        name: json["name"],
        private: json["private"],
        description: json["description"],
        updatedAt:
            json["updated_at"] == null
                ? null
                : DateTime.parse(json["updated_at"]),
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        stars: _parseStars(json['stargazers_count']),
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "private": private,
    "description": description,
    "updated_at": updatedAt?.toIso8601String(),
    "owner": owner?.toJson(),
    "stargazers_count": stars,
  };

  // A helper function to safely parse the stars field.
  static int? _parseStars(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is String) {
      return int.tryParse(value);
    } else if (value is int) {
      return value;
    }
    return null;
  }
}

class Owner {
  String? avatarUrl;

  Owner({this.avatarUrl});

  factory Owner.fromJson(Map<String, dynamic> json) =>
      Owner(avatarUrl: json["avatar_url"]);

  Map<String, dynamic> toJson() => {"avatar_url": avatarUrl};
}
