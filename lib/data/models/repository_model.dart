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

  RepositoryModel({
    this.name,
    this.private,
    this.description,
    this.updatedAt,
    this.owner,
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
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "private": private,
    "description": description,
    "updated_at": updatedAt?.toIso8601String(),
    "owner": owner?.toJson(),
  };
}

class Owner {
  String? avatarUrl;

  Owner({this.avatarUrl});

  factory Owner.fromJson(Map<String, dynamic> json) =>
      Owner(avatarUrl: json["avatar_url"]);

  Map<String, dynamic> toJson() => {"avatar_url": avatarUrl};
}
