import 'dart:convert';

RepositoryModel repositoryModelFromJson(String str) =>
    RepositoryModel.fromJson(json.decode(str));

String repositoryModelToJson(RepositoryModel data) =>
    json.encode(data.toJson());

class RepositoryModel {
  Owner owner;
  String fullName;
  String? description;
  List<String>? topics;
  String? language;
  int? stars;
  DateTime updatedAt;

  // For Details View
  int? forksCount;
  int? watchersCount;
  int? openIssuesCount;

  RepositoryModel({
    required this.owner,
    required this.fullName,
    this.description,
    this.topics,
    this.language,
    this.stars,
    required this.updatedAt,
    this.forksCount,
    this.watchersCount,
    this.openIssuesCount,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      RepositoryModel(
        owner: Owner.fromJson(json["owner"]),
        fullName: json["full_name"],
        description: json["description"],
        topics: List<String>.from(json["topics"].map((x) => x)),
        language: json["language"],
        stars: _parseStars(json['stargazers_count']),
        updatedAt: DateTime.parse(json["updated_at"]),
        forksCount: json['forks_count'],
        watchersCount: json['watchers_count'],
        openIssuesCount: json['open_issues_count'],
      );

  Map<String, dynamic> toJson() => {
    "owner": owner.toJson(),
    "full_name": fullName,
    "description": description,
    "topics": List<dynamic>.from(topics!.map((x) => x)),
    "language": language,
    "stargazers_count": stars,
    "updated_at": updatedAt.toIso8601String(),
    "forks_count": forksCount,
    "watchers_count": watchersCount,
    "open_issues_count": openIssuesCount,
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
