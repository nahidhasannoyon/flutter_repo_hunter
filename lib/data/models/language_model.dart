class LanguageModel {
  String? imageUrl;
  String? languageName;
  String? languageCode;
  String? countryCode;

  LanguageModel({
    this.imageUrl,
    this.languageName,
    this.countryCode,
    this.languageCode,
  });
  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      imageUrl: json['imageUrl'],
      languageName: json['languageName'],
      languageCode: json['languageCode'],
      countryCode: json['countryCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'languageName': languageName,
      'languageCode': languageCode,
      'countryCode': countryCode,
    };
  }
}
